# frozen_string_literal: true

class MyAdapters < Dry::Transaction::StepAdapters
  register :merge, MergeStepAdapter.new
end
