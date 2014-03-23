require 'spec_helper'

describe "Static pages" do

  describe "Contact page" do

    it "should have title 'Contact us'" do
      visit '/static_pages/Contact'
      expect(page).to have_title('Heart Space Mission :: Contact us')
    end

    it "should have content 'Contact us'" do
      visit '/static_pages/Contact'
      expect(page).to have_content('Contact us')
    end

  end

  describe "Help & support page" do

    it "should have title 'Help & Support'" do
      visit '/static_pages/Help'
      expect(page).to have_title('Heart Space Mission :: Help & Support')
    end

    it "should have content 'Help & Support'" do
      visit '/static_pages/Help'
      expect(page).to have_content('Help & Support')
    end
  end

  describe "Pricing page" do

    it "should have title 'Pricing'" do
      visit '/static_pages/Pricing'
      expect(page).to have_title('Heart Space Mission :: Pricing')
    end

    it "should have content 'Pricing'" do
      visit '/static_pages/Pricing'
      expect(page).to have_content('Pricing')
    end
  end

  describe "About page" do

    it "should have title 'About'" do
      visit '/static_pages/About'
      expect(page).to have_title('Heart Space Mission :: About')
    end

    it "should have content 'About us'" do
      visit '/static_pages/About'
      expect(page).to have_content('About us')
    end
  end

  describe "Home page" do

    it "should have title 'Heart Space Mission'" do
      visit '/static_pages/Home'
      expect(page).to have_title('Heart Space Mission :: About')
    end

    it "should have content 'Heart Space Mission'" do
      visit '/static_pages/Home'
      expect(page).to have_content('Heart Space Mission')
    end
  end


end
