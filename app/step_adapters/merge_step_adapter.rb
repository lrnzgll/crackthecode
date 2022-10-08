# frozen_string_literal: true

class MergeStepAdapter < Dry::Transaction::StepAdapters
  include Dry::Monads::Result::Mixin

  def call(operation, _options, input)
    result = operation.call(input[0])
    return result if result.try(:failure?)

    value = result.try(:value!) || result || {}
    value = { operation.operation.name => value } unless value.is_a?(Hash)

    Success(input[0].merge(value))
  end
end
