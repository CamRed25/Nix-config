# security.nix
# System security configuration including firewall and intrusion prevention
{pkgs, ...}: {
  # Core security settings
  security = {
    sudo.enable = true;
    polkit.enable = true;
    rtkit.enable = true; # Real-time scheduling for audio

    # PAM configuration for screen lockers
    pam.services.gtklock = {
      text = ''
        auth      include login
        account   include login
        password  include login
        session   include login
      '';
    };

    # AppArmor security framework
    apparmor = {
      enable = true;
      killUnconfinedConfinables = true;
    };

    # Audit framework for security monitoring
    audit = {
      enable = true;
      rules = [
        # Monitor privilege escalation
        "-a always,exit -F arch=b64 -S execve -F euid=0 -F auid>=1000 -F auid!=4294967295 -k privileged"
        # Monitor file access in sensitive directories
        "-w /etc/passwd -p wa -k passwd_changes"
        "-w /etc/shadow -p wa -k shadow_changes"
        "-w /etc/sudoers -p wa -k sudoers_changes"
        # Monitor network configuration changes
        "-w /etc/hosts -p wa -k network_changes"
        "-w /etc/resolv.conf -p wa -k network_changes"
      ];
    };
  };

  # Network firewall configuration
  networking.firewall = {
    enable = true;

    # Default policies
    allowPing = false; # Disable ping responses for stealth

    # Allowed TCP ports (customize based on your needs)
    allowedTCPPorts = [
    ];

    # Allowed UDP ports
    allowedUDPPorts = [
    ];

    # Port ranges (if needed for specific applications)
    allowedTCPPortRanges = [
    ];

    allowedUDPPortRanges = [
    ];

    # Interfaces to trust completely (be careful with this)
    trustedInterfaces = [
      "lo" # Loopback interface (localhost)
    ];

    # Extra firewall rules using iptables syntax
    extraCommands = ''
      # Drop invalid packets
      iptables -A INPUT -m conntrack --ctstate INVALID -j DROP

      # Rate limit SSH connections (if SSH is enabled)
      # iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW -m recent --set
      # iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW -m recent --update --seconds 60 --hitcount 4 -j DROP

      # Log dropped packets (uncomment for debugging)
      # iptables -A INPUT -j LOG --log-prefix "FIREWALL-DROP: " --log-level 4
    '';

    # Rules to execute when stopping firewall
    extraStopCommands = ''
      # Clear any custom rules when stopping
      iptables -F || true
      iptables -X || true
    '';
  };

  # Fail2ban intrusion prevention system
  services.fail2ban = {
    enable = true;
    maxretry = 3;
    bantime = "10m"; # Ban for 10 minutes initially
    bantime-increment = {
      enable = true;
      formula = "ban.Time * (1<<(ban.Count if ban.Count<20 else 20)) * banFactor";
      factor = "2";
      maxtime = "1h"; # Maximum ban time
    };

    # Custom jail configurations
    jails = {
      # SSH protection (enable if you use SSH)
      sshd = ''
        enabled = false
        filter = sshd
        logpath = /var/log/auth.log
        maxretry = 3
        bantime = 1h
      '';

      # General authentication failures
      pam-generic = ''
        enabled = true
        filter = pam-generic
        logpath = /var/log/auth.log
        maxretry = 5
        bantime = 30m
      '';
    };
  };

  # Security programs (prefer programs.* over environment.systemPackages)
  programs = {
    # GNU Privacy Guard with better system integration
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryPackage = pkgs.pinentry-gtk2;
    };

    # Wireshark with proper permissions
    wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };
  };

  # Additional security packages
  environment.systemPackages = with pkgs; [
    # Network security tools
    nmap # Network discovery and security auditing
    netcat-gnu # Network utility for debugging and exploration
    tcpdump # Network packet analyzer
    # wireshark # Moved to programs.wireshark for better integration

    # System security tools
    lynis # Security auditing tool

    # Cryptography tools
    # gnupg # Moved to programs.gnupg for better integration
    openssl # SSL/TLS toolkit

    # Password and authentication
    # keepassxc # Already available in common.nix

    # File integrity monitoring
    aide # Advanced Intrusion Detection Environment
  ];

  # Systemd security enhancements
  systemd.services = {
    # Example of hardening a systemd service
    fail2ban.serviceConfig = {
      # Security hardening for fail2ban service
      NoNewPrivileges = true;
      PrivateTmp = true;
      ProtectSystem = "strict";
      ProtectHome = true;
      ReadWritePaths = "/var/lib/fail2ban";
    };
  };

  # Kernel security parameters
  boot.kernel.sysctl = {
    # Network security
    "net.ipv4.ip_forward" = 0; # Disable IP forwarding
    "net.ipv4.conf.all.send_redirects" = 0;
    "net.ipv4.conf.default.send_redirects" = 0;
    "net.ipv4.conf.all.accept_redirects" = 0;
    "net.ipv4.conf.default.accept_redirects" = 0;
    "net.ipv4.conf.all.secure_redirects" = 0;
    "net.ipv4.conf.default.secure_redirects" = 0;
    "net.ipv6.conf.all.accept_redirects" = 0;
    "net.ipv6.conf.default.accept_redirects" = 0;

    # Ignore ICMP ping requests
    "net.ipv4.icmp_echo_ignore_all" = 1;

    # Ignore broadcast ping requests
    "net.ipv4.icmp_echo_ignore_broadcasts" = 1;

    # Log suspicious packets
    "net.ipv4.conf.all.log_martians" = 1;
    "net.ipv4.conf.default.log_martians" = 1;

    # Protect against SYN flood attacks
    "net.ipv4.tcp_syncookies" = 1;
    "net.ipv4.tcp_syn_retries" = 2;
    "net.ipv4.tcp_synack_retries" = 2;
    "net.ipv4.tcp_max_syn_backlog" = 4096;

    # Memory protection
    "kernel.dmesg_restrict" = 1;
    "kernel.kptr_restrict" = 2;
    "kernel.yama.ptrace_scope" = 1;

    # Disable magic SysRq key
    "kernel.sysrq" = 0;
  };
}
