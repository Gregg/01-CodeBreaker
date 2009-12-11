require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Marker do
  context "No matches" do
    it "Should return []" do
      m = Marker.new('r y g b')
      m.guess('c c c c')
      m.mark.should == []    
    end
  end
  
  context "1 non-positional match" do
    it "Should return ['m']" do
      m = Marker.new('r y g b')
      m.guess('b c c c')
      m.mark.should == ['m']    
    end
    
    it "Should also return ['m']" do
      m = Marker.new('r y g b')
      m.guess('c b c c')
      m.mark.should == ['m']    
    end
  end
  
  context "2 non-positional matches" do
    it "Should return ['m', 'm']" do
      m = Marker.new('r y g b')
      m.guess('b g c c')
      m.mark.should == ['m', 'm']    
    end
  end
  
  context "3 non-positional matches" do
    it "Should return ['m', 'm', 'm']" do
      m = Marker.new('r y g b')
      m.guess('b g r c')
      m.mark.should == ['m', 'm', 'm']    
    end
  end
  
  context "4 non-positional matches" do
    it "Should return ['m', 'm', 'm', 'm']" do
      m = Marker.new('r y g b')
      m.guess('b g r y')
      m.mark.should == ['m', 'm', 'm', 'm']    
    end
  end

  context "1 positional match" do
    it "Should return ['p']" do
      m = Marker.new('r y g b')
      m.guess('r c c c')
      m.mark.should == ['p']    
    end
  end
  
  context "2 positional matches" do
    it "Should return ['p','p']" do
      m = Marker.new('r y g b')
      m.guess('r y c c')
      m.mark.should == ['p','p']    
    end
  end
  
  context "3 positional matches" do
    it "Should return ['p','p']" do
      m = Marker.new('r y g b')
      m.guess('r y g c')
      m.mark.should == ['p','p','p']    
    end
  end
  
  context "4 positional matches" do
    it "Should return ['p','p']" do
      m = Marker.new('r y g b')
      m.guess('r y g b')
      m.mark.should == ['p','p','p','p']    
    end
  end
  
  context "1 positional match and 1 non-positional match" do
    it "Should return ['m','p']" do
      m = Marker.new('r y g b')
      m.guess('g y c c')
      m.mark.should == ['m', 'p']    
    end
  end
  
  context "2 positional match and 2 non-positional match" do
    it "Should return ['p','p','m','m']" do
      m = Marker.new('r y g b')
      m.guess('r y b g')
      m.mark.should == ['p','p','m','m']    
    end
  end
end