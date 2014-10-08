require 'spec_helper'

RSpec.describe Bullshit do
  describe "generating" do
    subject { Bullshit.generate }

    it { expect(Bullshit.generate).to be_kind_of Bullshit }
    it { expect(subject.seed).to match /^\d+\-\d+\-\d+\-\d+$/ }
    it { expect(subject.shit).to be_kind_of String }
  end

  describe "loading" do
    it { expect(Bullshit.new("0-0-0-1").shit).to match /^Pomembno/ }
    it { expect(Bullshit.new.shit).to be_kind_of String }
  end
end
