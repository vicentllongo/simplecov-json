# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SimpleCov::Sublime::SourceFileWrapper do
  let(:wrapper)           { described_class.new(source_file) }
  let(:created_at)        { Time.now.to_s }
  let(:source_file)       { instance_double(SimpleCov::SourceFile) }
  let(:line_list)         { instance_double(Array) }
  let(:coverage_data)     { [1, nil, 0, 0, nil, 1, nil] }

  describe '#to_h' do
    subject(:to_h) { wrapper.to_h }

    let(:expected_hash) do
      {
        filename: '/lib/source_file.rb',
        covered_percent: 50.0,
        coverage: [1, nil, 0, 0, nil, 1, nil],
        covered_strength: 0.50,
        covered_lines: 2,
        lines_of_code: 4
      }
    end

    before do
      allow(source_file).to receive(:filename).twice.and_return('/lib/source_file.rb')
      allow(source_file).to receive(:covered_percent).and_return(50.0)
      if SimpleCov::SourceFile.instance_methods.include?(:coverage_data)
        allow(source_file).to receive(:coverage_data).and_return(coverage_data)
      else
        allow(source_file).to receive(:coverage).and_return(coverage_data)
      end
      allow(source_file).to receive(:covered_strength).twice.and_return(0.50)
      allow(source_file).to receive(:covered_lines).and_return(line_list)
      allow(source_file).to receive(:lines_of_code).and_return(4)

      allow(line_list).to receive(:count).and_return(2)
    end

    it { is_expected.to eq(expected_hash) }

    context 'when coverage_data is a hash with the key `lines:`' do
      let(:coverage_data) { { 'lines' => [1, nil, 0, 0, nil, 1, nil] } }

      it { is_expected.to eq(expected_hash) }
    end
  end

  # rubocop:disable RSpec/MessageChain
  describe '#coverage' do
    subject(:coverage) { wrapper.send(:coverage) }

    let(:source_file) { double }

    context 'when SimpleCov::SourceFile respond_to :coverage_data' do
      before do
        allow(SimpleCov::SourceFile).to receive_message_chain('instance_methods.include?')
          .with(:coverage_data).and_return(true)

        allow(source_file).to receive(:coverage_data).and_return(coverage_data)
      end

      it { is_expected.to eq(coverage_data) }
    end

    context 'when SimpleCov::SourceFile does not respond_to :coverage_data' do
      before do
        allow(SimpleCov::SourceFile).to receive_message_chain('instance_methods.include?')
          .with(:coverage_data).and_return(false)
        allow(source_file).to receive(:coverage).and_return(coverage_data)
      end

      it { is_expected.to eq(coverage_data) }
    end
  end
  # rubocop:enable RSpec/MessageChain

  describe '#covered_strength' do
    subject(:covered_strength) { wrapper.send(:covered_strength) }

    context 'when source_file.covered_strength is nil' do
      before do
        allow(source_file).to receive(:covered_strength).and_return(nil)
      end

      it { is_expected.to eq(0.0) }
    end

    context 'when source_file.covered_strength is NAN' do
      before do
        allow(source_file).to receive(:covered_strength).and_return(Float::NAN)
      end

      it { is_expected.to eq(0.0) }
    end

    context 'when source_file.covered_strength is 50.0' do
      before do
        allow(source_file).to receive(:covered_strength).and_return(50.0)
      end

      it { is_expected.to eq(50.0) }
    end
  end
end
