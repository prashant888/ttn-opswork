actions :copy
default_action :copy

attribute :command, kind_of: String,
    default: node['fen']['site']['deploy']['command']

attribute :options, kind_of: String,
    default: node['fen']['site']['deploy']['flags']

attribute :origin, kind_of: String,
    default: node['fen']['site']['deploy']['origin']

attribute :local_path, kind_of: String,
    default: node['fen']['site']['deploy']['nfspath']

attribute :sitegroup, kind_of: String,
    default: node['fen']['site']['sitegroup']

attribute :source_path, kind_of: String,
    default: "/site/html"

attribute :dest_path, kind_of: String,
          default: "/site/"