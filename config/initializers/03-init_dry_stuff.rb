# ##
# 03-init_auto_inject
#
# Skn::Import['key']
# def initialize(options);
#   # super(options)
# end
#

Dry::Types.load_extensions(:maybe)
module Types
  include Dry::Types.module

  Email = String.constrained(format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
  SerializedArrayRead = Types.Constructor(Types.Array(Types::Strict::String)) { |yaml_str| yaml_str.nil? ? [] : Psych.load(yaml_str).compact }
  SerializedArrayWrite = Types.Constructor(Types::Strict::String) { |ary_of_str| ary_of_str.nil? ? Psych.dump([])  : Psych.dump(ary_of_str.compact) }

end
# ##
# Ref: https://dry-rb.org/gems/dry-monads/1.0/maybe/
#
M = Dry::Monads


# ##
# Ref: https://dry-rb.org/gems/dry-validation/
# - Used in combination with Dry-Struct
#
Dry::Validation.load_extensions(:monads)
Dry::Validation.load_extensions(:struct)

module Skn

  Import = Dry::AutoInject(SknApp.registry).hash

  # ##
  # Ref: https://dry-rb.org/gems/dry-struct/
  #
  # class SymbolizeStruct < Dry::Struct
  #   transform_keys(&:to_sym)
  # end
  #
  # class User < Skn::SymbolizeStruct
  #   attribute :name, Types::Strict::String.optional
  #   attribute :age, Types::Coercible::Integer
  # end

end

