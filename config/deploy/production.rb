set :port, 8888
set :user, 'ruby'
set :deploy_via, :remote_cache
set :use_sudo, false

server '178.208.85.208',
  roles: [:web, :app, :db],
  port: fetch(:port),
  user: fetch(:user),
  primary: true

set :deploy_to, "/var/www/apps/#{fetch(:application)}"

set :ssh_options, {
  forward_agent: true,
  auth_methods: %w(publickey),
  user: 'ruby',
}

set :rails_env, :production
set :conditionally_migrate, true