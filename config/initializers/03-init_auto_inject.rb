# ##
# 03-init_auto_inject
#
# Skn::Import['key']
# def initialize(options);
#   # super(options)
# end
#

module Skn

  Import = Dry::AutoInject(SknApp.registry).hash

end
