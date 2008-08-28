require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe Wallscrawl, "index action" do
  before(:each) do
    dispatch_to(Wallscrawl, :index)
  end
end