module Gitstats
  class Diff
    attr_accessor :commit_a, :commit_b
    def initialize(repo, commit_a, commit_b)
      @repo = ::Grit::Repo.new(repo)
      @commit_a = commit_a
      @commit_b = commit_b
    end

    def commits
      @repo.diff(@commit_b, @commit_a)
    end

    def diff_text
      # puts commits.first.diff
      commits.first.diff.split("\n")
    end


    def addition_count
      diff_text.select { |s| s =~ /^\+/ && !(s =~ /^\+{3}/) }.size
    end

    def removal_count
      diff_text.select { |s| s =~ /^\-/ && !(s =~ /^\-{3}/) }.size
    end

  end
end
