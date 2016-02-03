# You can choose between "package" (for dibian base OS) or "pip"
default['graphite_api']['install_method'] = 'pip'

default['graphite_api']['search_index'] = '/srv/graphite/index'
default['graphite_api']['time_zone'] = 'Europe/Berlin'
default['graphite_api']['functions'] = ['graphite_api.functions.SeriesFunctions', 'graphite_api.functions.PieFunctions']
default['graphite_api']['finders'] = []

# Whisper config
default['graphite_api']['whisper'] = {
  'enabled' => true,
  'directories' => ['/srv/graphite/whisper']
}
if node['graphite_api']['whisper']['enabled'] == true
  default['graphite_api']['finders'] |= ['graphite_api.finders.whisper.WhisperFinder']
end

case node['platform_family']
when 'debian'
    default['graphite_api']['gunicorn_path'] = '/usr/local/bin/gunicorn'
when 'rhel'
    default['graphite_api']['gunicorn_path'] = '/usr/bin/gunicorn'
end

default['graphite_api']['gunicorn_path'] = '/usr/local/bin/gunicorn'
default['graphite_api']['gunicorn_workers'] = 1
default['graphite_api']['bind_address'] = '0.0.0.0'
default['graphite_api']['bind_port'] = 8888
