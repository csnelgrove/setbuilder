# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/var/rails/churchos"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/var/rails/churchos/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/var/rails/churchos/log/unicorn.log"
stdout_path "/var/rails/churchos/log/unicorn.log"

# Unicorn socket
listen "/tmp/unicorn.[churchos].sock"
listen "/tmp/unicorn.churchos.sock"

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30
