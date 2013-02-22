require "spec_helper"

describe "Static pages" do

	subject { page }
	
	shared_examples_for "all static pages" do
		it { should have_selector("h1", text: heading) }
		it { should have_selector("title", text: full_title(page_title)) }
	end
	
	describe "Home page" do
		before { visit root_path }
		let(:heading) { "G. F. Johnson Golf" }
		let(:page_title) { "" }
		
		it_should_behave_like "all static pages"
		it { should_not have_selector("title", text: "| Home") }
	end
	
	describe "Products & Services page" do
		before { visit products_and_services_path }
		let(:heading) { "Products & Services" }
		let(:page_title) { "Products and Services" }
		
		it_should_behave_like "all static pages"
	end
	
	describe "Technology page" do
		before { visit technology_path }
		let(:heading) { "Technology" }
		let(:page_title) { "Technology" }
		
		it_should_behave_like "all static pages"
	end
	
	describe "About page" do
		before { visit about_path }
		let(:heading) { "About" }
		let(:page_title) { "About" }
		
		it_should_behave_like "all static pages"
	end
	
	describe "Contact page" do
		before { visit contact_path }
		let(:heading) { "Contact" }
		let(:page_title) { "Contact" }
		
		it_should_behave_like "all static pages"
	end
	
	it "should have the right links on the layout" do
		# TODO
		visit root_path
		# Home Link
		click_link "G. F. Johnson Golf"
		page.should have_selector "title", text: full_title("")
		# Products & Services Link
		click_link "Products & Services"
		page.should have_selector "title", text: full_title("Products and Services")
		#Technology Link
		click_link "Technology"
		page.should have_selector "title", text: full_title("Technology")
		# About Link
		click_link "About"
		page.should have_selector "title", text: full_title("About")
		# Contact Link
		click_link "Contact"
		page.should have_selector "title", text: full_title("Contact")
		# Schedule a Lesson Link
		click_link "Home"
		click_link "Schedule a lesson today!"
		page.should have_selector "title", text: full_title("Sign up")
		
	end
end