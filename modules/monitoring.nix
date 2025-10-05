# monitoring.nix
# System monitoring and diagnostics tools configuration
{pkgs, ...}: {
  # Hardware monitoring services
  services = {
    # S.M.A.R.T disk monitoring
    smartd = {
      enable = true;
      autodetect = true;
      defaults.monitored = "-a -o on -s (S/../.././02|L/../../6/03)";
    };

    # System statistics collection
    sysstat.enable = true;
  };

  # System monitoring and diagnostic tools
  environment.systemPackages = with pkgs; [
    # Hardware monitoring
    lm_sensors # Hardware monitoring (temp, voltage, fan speeds)
    smartmontools # S.M.A.R.T disk monitoring and testing
    nvitop # GPU monitoring (NVIDIA, AMD, Intel)
    mission-center # Modern system monitoring GUI

    # Storage and filesystem monitoring
    iotop # I/O monitoring per process
    ncdu # Disk usage analyzer (ncurses)
    du-dust # Modern disk usage analyzer
    duf # Modern df alternative

    # Network monitoring
    nethogs # Per-process network usage monitor
    iftop # Network bandwidth usage per interface
    nload # Network load monitor
    speedtest-cli # Internet speed testing
    mtr # Network diagnostic tool (traceroute + ping)

    # Process and system monitoring
    htop # Interactive process monitor (already in dev.nix)
    btop # Modern system monitor
    gtop # System monitor in your terminal

    # Memory monitoring
    smem # Memory usage reporting tool

    # System information
    neofetch # System information display
    inxi # System information script
    hwinfo # Hardware information
    lshw # Hardware lister
    usbutils # USB device utilities (lsusb)
    pciutils # PCI utilities (lspci)

    # Performance monitoring and profiling
    perf-tools # Performance analysis tools
    sysstat # System performance tools (sar, iostat, mpstat)
    stress # System stress testing
    stress-ng # Extended stress testing

    # Log monitoring and analysis
    lnav # Log file navigator
    multitail # Multi-file tail utility

    # System benchmarking
    sysbench # System benchmarking suite

    # Container and virtualization monitoring
    ctop # Container monitoring (if using containers)

    # Power management monitoring (useful for laptops/efficiency)
    powertop # Power consumption analyzer

    # Memory debugging
    valgrind # Memory debugging and profiling tools

    # File system monitoring
    inotify-tools # File system event monitoring

    # System diagnostics
    strace # System call tracer
    ltrace # Library call tracer
    gdb # GNU debugger
  ];

  # Systemd services for monitoring automation
  systemd.services = {
    # Daily hardware health check
    hardware-health-check = {
      description = "Daily hardware health monitoring";
      serviceConfig = {
        Type = "oneshot";
        ExecStart = pkgs.writeShellScript "hardware-health-check" ''
          #!/bin/bash

          # Create log directory
          mkdir -p /var/log/hardware-health

          LOG_FILE="/var/log/hardware-health/$(date +%Y-%m-%d).log"

          echo "=== Hardware Health Check - $(date) ===" >> "$LOG_FILE"

          # Check temperatures
          echo "--- Temperature Status ---" >> "$LOG_FILE"
          ${pkgs.lm_sensors}/bin/sensors >> "$LOG_FILE" 2>&1 || echo "lm_sensors not available" >> "$LOG_FILE"

          # Check disk health
          echo "--- Disk Health Status ---" >> "$LOG_FILE"
          for disk in $(lsblk -nd -o NAME | grep -E '^(sd|nvme)'); do
            echo "Checking /dev/$disk:" >> "$LOG_FILE"
            ${pkgs.smartmontools}/bin/smartctl -H /dev/$disk >> "$LOG_FILE" 2>&1
          done

          # Check memory
          echo "--- Memory Status ---" >> "$LOG_FILE"
          free -h >> "$LOG_FILE"

          # Check disk space
          echo "--- Disk Space ---" >> "$LOG_FILE"
          df -h >> "$LOG_FILE"

          # Check load average
          echo "--- System Load ---" >> "$LOG_FILE"
          uptime >> "$LOG_FILE"

          echo "=== End Health Check ===" >> "$LOG_FILE"
          echo "" >> "$LOG_FILE"

          # Check for critical issues and send notifications if needed
          if ${pkgs.smartmontools}/bin/smartctl -A /dev/sda 2>/dev/null | grep -E "(FAILING_NOW|In_the_past)"; then
            echo "CRITICAL: Disk health issues detected!" >> "$LOG_FILE"
            # Optional: Send notification to user
            # ${pkgs.libnotify}/bin/notify-send "Hardware Alert" "Disk health issues detected. Check /var/log/hardware-health/"
          fi
        '';
      };
    };

    # System performance monitoring
    performance-monitor = {
      description = "System performance data collection";
      serviceConfig = {
        Type = "oneshot";
        ExecStart = pkgs.writeShellScript "performance-monitor" ''
          #!/bin/bash

          # Create performance log directory
          mkdir -p /var/log/performance

          DATE=$(date +%Y-%m-%d)
          PERF_LOG="/var/log/performance/perf-$DATE.log"

          echo "=== Performance Data - $(date) ===" >> "$PERF_LOG"

          # CPU usage
          echo "--- CPU Usage ---" >> "$PERF_LOG"
          ${pkgs.sysstat}/bin/mpstat 1 5 >> "$PERF_LOG"

          # I/O statistics
          echo "--- I/O Statistics ---" >> "$PERF_LOG"
          ${pkgs.sysstat}/bin/iostat -x 1 3 >> "$PERF_LOG"

          # Network statistics
          echo "--- Network Statistics ---" >> "$PERF_LOG"
          ${pkgs.sysstat}/bin/sar -n DEV 1 3 >> "$PERF_LOG"

          echo "=== End Performance Data ===" >> "$PERF_LOG"
          echo "" >> "$PERF_LOG"
        '';
      };
    };
  };

  # Systemd timers for automated monitoring
  systemd.timers = {
    hardware-health-check = {
      description = "Run hardware health check daily";
      wantedBy = ["timers.target"];
      timerConfig = {
        OnCalendar = "daily";
        Persistent = true;
        RandomizedDelaySec = "30m";
      };
    };

    performance-monitor = {
      description = "Collect performance data every 4 hours";
      wantedBy = ["timers.target"];
      timerConfig = {
        OnCalendar = "*-*-* 00,06,12,18:00:00";
        Persistent = true;
        RandomizedDelaySec = "15m";
      };
    };
  };

  # Log rotation for monitoring logs
  services.logrotate.settings = {
    hardware-health = {
      files = "/var/log/hardware-health/*.log";
      frequency = "weekly";
      rotate = 4;
      compress = true;
      delaycompress = true;
      missingok = true;
      notifempty = true;
      create = "644 root root";
    };

    performance = {
      files = "/var/log/performance/*.log";
      frequency = "weekly";
      rotate = 8;
      compress = true;
      delaycompress = true;
      missingok = true;
      notifempty = true;
      create = "644 root root";
    };
  };

  # Enable systemd-oomd for better memory management
  systemd.oomd = {
    enable = true;
    enableRootSlice = true;
    enableUserSlices = true;
  };

  # Kernel parameters for better monitoring
  boot.kernel.sysctl = {
    # Enable detailed accounting
    "kernel.task_delayacct" = 1;

    # Better memory management
    "vm.swappiness" = 10; # Reduce swapping
    "vm.vfs_cache_pressure" = 50; # Keep more file system cache
  };
}
