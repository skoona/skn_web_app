# ##
# 03-init_auto_inject
#

# ##
# Ref: https://dry-rb.org/gems/dry-monads/1.0/maybe/
#
M = Dry::Monads

# ##
# Ref: https://dry-rb.org/gems/dry-validation/
# - Used in combination with Dry-Struct
#
# Dry::Validation.load_extensions(:monads)
# Dry::Validation.load_extensions(:struct)
Dry::Types.load_extensions(:maybe)

module Types
  include Dry::Types.module

  Email = String.constrained(format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
  SerializedArrayRead  = Types.Constructor(Types.Array(Types::Strict::String)) { |yaml_str| yaml_str.nil? ? [] : Psych.load(yaml_str).compact }
  SerializedArrayWrite = Types.Constructor(Types::Strict::String) { |ary_of_str| ary_of_str.nil? ? Psych.dump([])  : Psych.dump(ary_of_str.compact) }
  StringWithoutBlanks  = Types.Constructor(Types::Strict::String) { |raw_str| raw_str.nil? ? "" : raw_str.gsub!(/\s+/) }
end



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
