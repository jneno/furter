require 'spec_helper'

describe Furter::Accessors::View do
  let(:view) { Furter::Accessors::View.new(:label => 'id') }
  let(:selector) { view.send(:selector) }

  context 'locating views' do
    it 'can be found by accessibility label' do
      by_label = Furter::Accessors::View.new(:label => 'id')
      by_label.send(:selector).should eq("view marked:'id'")
    end

    it 'can use a custom type' do
      by_type = Furter::Accessors::View.new(:type => 'UICustomType', :label => 'id')
      by_type.send(:selector).should eq("view:'UICustomType' marked:'id'")
    end

    it 'can pass extra information as well' do
      with_extras = Furter::Accessors::View.new(:label => 'id', :extra => 'label')
      with_extras.send(:selector).should eq("view marked:'id' label")
    end
  end

  it 'can be clicked' do
    view.should_receive(:wait_for_and_touch).with(selector)
    view.click
  end

  it 'knows if it is visible' do
    view.should_receive(:element_is_not_hidden).with(selector).and_return(true)
    view.should be_visible
  end

  it 'knows if it is enabled' do
    view.should_receive(:frankly_map).with(selector, 'isEnabled').and_return([true])
    view.should be_enabled
  end
end