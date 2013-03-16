require 'spec_helper'
require 'gitstats/diff'

describe Gitstats::Diff do
  let(:commit_a) { '23972cc' }
  let(:commit_b) { '4925992' }

  context "Diff commit A, B" do
    let(:diff) {
      Gitstats::Diff.new(GIT_REPO, commit_a, commit_b)
    }

    it "diff commit A, B should count additions" do
      diff.addition_count.should == 8
    end

    it "diff commit A, B should count removals" do
      diff.removal_count.should  == 3
    end

  end
end
