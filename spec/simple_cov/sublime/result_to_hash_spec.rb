# frozen_string_literal: true

RSpec.describe SimpleCov::Sublime::ResultToHash do
  let(:described_object)  { described_class.new(result) }
  let(:result)            { instance_double(SimpleCov::Result) }
  let(:command_name)      { 'RSpec' }
  let(:created_at)        { Time.now.to_s }
  let(:foo)               { instance_double(SimpleCov::SourceFile) }
  let(:foo_line_list)     { instance_double(Array) }
  let(:foo_coverage_data) { [1, nil, 0, 0, nil, 1, nil] }
  let(:bar)               { instance_double(SimpleCov::SourceFile) }
  let(:bar_line_list)     { instance_double(Array) }
  let(:bar_coverage_data) { [nil, 1, nil, 1, 1, 1, 0, 0, nil, 1, nil] }

  describe '#source_file_collection' do
    subject(:source_file_collection) { described_object.send(:source_file_collection) }

    before do
      allow(result).to receive(:created_at).and_return(created_at)
      allow(result).to receive(:command_name).and_return(command_name)
      allow(result).to receive(:covered_lines).and_return(11)
      allow(result).to receive(:covered_percent).and_return(73.33)
      allow(result).to receive(:covered_strength).twice.and_return(0.87)
      allow(result).to receive(:files).and_return([foo, bar])
      allow(result).to receive(:filenames).twice.and_return(['/lib/foo.rb'])
      allow(result).to receive(:total_lines).and_return(15)

      allow(foo).to receive(:filename).twice.and_return('/lib/foo.rb')
      allow(foo).to receive(:covered_percent).and_return(50.0)
      if SimpleCov::SourceFile.instance_methods.include?(:coverage_data)
        allow(foo).to receive(:coverage_data).and_return(foo_coverage_data)
      else
        allow(foo).to receive(:coverage).and_return(foo_coverage_data)
      end
      allow(foo).to receive(:covered_strength).twice.and_return(0.50)
      allow(foo).to receive(:covered_lines).and_return(foo_line_list)
      allow(foo).to receive(:lines_of_code).and_return(4)

      allow(foo_line_list).to receive(:count).and_return(2)

      allow(bar).to receive(:filename).twice.and_return('/lib/bar.rb')
      allow(bar).to receive(:covered_percent).and_return(71.42)
      if SimpleCov::SourceFile.instance_methods.include?(:coverage_data)
        allow(bar).to receive(:coverage_data).and_return(bar_coverage_data)
      else
        allow(bar).to receive(:coverage).and_return(bar_coverage_data)
      end
      allow(bar).to receive(:covered_strength).twice.and_return(0.71)
      allow(bar).to receive(:covered_lines).and_return(bar_line_list)
      allow(bar).to receive(:lines_of_code).and_return(7)

      allow(bar_line_list).to receive(:count).and_return(5)
    end

    context 'when result.file_names is missing entry for file' do
      it 'excludes the missing file' do
        expect(source_file_collection.size).to eq(1)
      end
    end
  end
end
