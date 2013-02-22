require "spec_helper"

describe ApplicationHelper do
	
	describe "full_title" do
		it "should have the page title" do
			full_title("foo").should =~ /foo/
		end
		
		it "should include the base title" do
			full_title("foo").should =~ /^G. F. Johnson Golf/
		end
		
		it "should not include a bar for the home page" do
			full_title("").should_not =~ /\|/
		end
	end
end