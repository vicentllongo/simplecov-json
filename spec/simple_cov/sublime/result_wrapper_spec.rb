# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SimpleCov::Sublime::ResultWrapper do
  let(:wrapper)      { described_class.new(result) }
  let(:result)       { instance_double(SimpleCov::Result) }

  describe '#covered_strength' do
    subject(:covered_strength) { wrapper.send(:covered_strength) }

    context 'when source_file.covered_strength is nil' do
      before do
        allow(result).to receive(:covered_strength).and_return(nil)
      end

      it { is_expected.to eq(0.0) }
    end

    context 'when source_file.covered_strength is NAN' do
      before do
        allow(result).to receive(:covered_strength).and_return(Float::NAN)
      end

      it { is_expected.to eq(0.0) }
    end

    context 'when source_file.covered_strength is 50.0' do
      before do
        allow(result).to receive(:covered_strength).and_return(50.0)
      end

      it { is_expected.to eq(50.0) }
    end
  end
end
