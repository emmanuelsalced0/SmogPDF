class PostPdf < Prawn::Document
  def initialize(post, view)
    super(top_margin: 30, right_margin: 30, left_margin: 30)
    
    @post = post
    @view= view
    
    image "#{Rails.root}/images/header.jpg", :width => bounds.width, :height => 186, :hposition => :center 
    image "#{Rails.root}/images/footer.jpg", :at => [0,80], :width => bounds.width, :height => 108, :hposition => :center   
    client_info
    payment
    checks
    billing
    date
  end

  def client_info
    clientnum
    name1
    phone
    totalsum
    address 
    veh_year
    make
    model
    licplate
    miles
    vin
  end

  def payment
    visa
    mastercard
    discover
    cash
  end

  def checks
    
    bounding_box([0, bounds.top - 370], :width => 80, :height => 270) do
      move_down 2
      pair
      air
      acl
      tccac
      efe
      egr
      can
      cat
      mil
      o2s
      pcv
      timing
      transparent(0.5) { stroke_bounds }
    end
  end

  def billing

    bounding_box([bounds.right-100, bounds.top - 360], :width => 100, :height => 30) do
      text "FEES:", size: 18, style: :bold, :inline_format => true
    end
    bounding_box([bounds.right - 400, bounds.top - 380], :width => 400, :height => 450) do
      casmog
      cainsp
      vin2
      casmogcert
      preinsp
      reinsp
      engcover
      other
      evap
      est
      gascap
      mis
      tax
      totaltax
    end
  end

  def name1
    bounding_box([0, bounds.top - 190], :width => 350, :height => 30) do
      text_box "Name: #{@post.Name} " + " . " * 50,:overflow => :truncate, size: 16, style: :bold
      #transparent(0.5) { stroke_bounds }
    end  
  end

  def phone 
    bounding_box([bounds.right - 200, bounds.top - 190], :width => 200, :height => 30) do
      text_box "|Phone: #{@post.Phone}"+ " . " * 50, :overflow => :truncate, size: 16, style: :bold
      #transparent(0.5) { stroke_bounds }
    end
  end

  def address
    bounding_box([0, bounds.top - 220], :width => bounds.right, :height => 30) do
      text_box "Address: #{@post.Adress}"+ " . " * 50,:overflow => :truncate, size: 16, style: :bold
      #transparent(0.5) { stroke_bounds }
    end
  end

  def veh_year
    bounding_box([0, bounds.top - 250], :width => 145, :height => 30) do
      text_box "Veh/Year: #{@post.Veh_Year}"+ " . " * 50,:overflow => :truncate, size: 16, style: :bold
      #transparent(0.5) { stroke_bounds }
    end
  end

  def make
    bounding_box([bounds.right - 406, bounds.top - 250], :width => 220, :height => 30) do
      text_box "| Make: #{@post.Make}"+ " . " * 50,:overflow => :truncate, size: 16, style: :bold
      #transparent(0.5) { stroke_bounds }
    end
  end

  def model
    bounding_box([bounds.right - 187, bounds.top - 250], :width => 187, :height => 30) do
      text_box "| Model: #{@post.Model}"+ " . " * 50, :overflow => :truncate, size: 16, style: :bold
      #transparent(0.5) { stroke_bounds }
    end
  end
  
  def licplate
    bounding_box([0, bounds.top - 280], :width => bounds.right - (bounds.right/3), :height => 30) do
      text_box "License Plate: #{@post.LicPlate}"+ " . " * 50, :overflow => :truncate, size: 16, style: :bold
      #transparent(0.5) { stroke_bounds }
    end
  end

  def miles
    bounding_box([bounds.right - (bounds.right/3), bounds.top - 280], :width => bounds.right/3, :height => 30) do
      text_box "| Miles: #{@post.Miles}"+ " . " * 50, :overflow => :truncate, size: 16, style: :bold
      #transparent(0.5) { stroke_bounds }
    end
  end
  
  def vin
    bounding_box([0, bounds.top - 310], :width => bounds.right, :height => 30) do
      text_box "V.I.N.: #{@post.VIN}"+ " . " * 50, :overflow => :truncate, size: 16, style: :bold
      #transparent(0.5) { stroke_bounds }
    end
  end

  def visa
    if(@post.Visa.to_f==1)
      bounding_box([27, bounds.top - 335], :width => 53, :height => 16) do
        text_box "Visa ", size: 16, style: :bold,:align => :right
        image "#{Rails.root}/images/check_true.jpg", :width => 14, :height => 14, :hposition => :center
        #transparent(0.5) { stroke_bounds }
      end
    end
    if(@post.Visa.to_f==0)
      bounding_box([27, bounds.top - 335], :width => 53, :height => 16) do
        text_box "Visa ", size: 16, style: :bold,:align => :right
        image "#{Rails.root}/images/check_false.jpg", :width => 14, :height => 14, :hposition => :center
        #transparent(0.5) { stroke_bounds }
      end
    end
  end

  def mastercard
    if(@post.MasterCard.to_f==1)
      bounding_box([100, bounds.top - 335], :width => 110, :height => 16) do
        text_box "MasterCard ", size: 16, style: :bold,:align => :right
        image "#{Rails.root}/images/check_true.jpg", :width => 14, :height => 14, :hposition => :center
        #transparent(0.5) { stroke_bounds }
      end
    end
    if(@post.MasterCard.to_f==0)
      bounding_box([100, bounds.top - 335], :width => 110, :height => 16) do
        text_box "MasterCard ", size: 16, style: :bold,:align => :right
        image "#{Rails.root}/images/check_false.jpg", :width => 14, :height => 14, :hposition => :center
        #transparent(0.5) { stroke_bounds }
      end
    end
  end


  def discover
    if(@post.Discover.to_f==1)
      bounding_box([231, bounds.top - 335], :width => 90, :height => 16) do
        text_box "Discover ", size: 16, style: :bold,:align => :right
        image "#{Rails.root}/images/check_true.jpg", :width => 14, :height => 14, :hposition => :center
        #transparent(0.5) { stroke_bounds }
      end
    end
    if(@post.Discover.to_f==0)
      bounding_box([231, bounds.top - 335], :width => 90, :height => 16) do
        text_box "Discover ", size: 16, style: :bold,:align => :right
        image "#{Rails.root}/images/check_false.jpg", :width => 14, :height => 14, :hposition => :center
       # transparent(0.5) { stroke_bounds }
      end
    end
  end

  def cash
    if(@post.Cash.to_f==1)
      bounding_box([340, bounds.top - 335], :width => 60, :height => 16) do
        text_box "Cash ", size: 16, style: :bold,:align => :right
        image "#{Rails.root}/images/check_true.jpg", :width => 14, :height => 14, :hposition => :center
       # transparent(0.5) { stroke_bounds }
      end
    end
    if(@post.Cash.to_f==0)
      bounding_box([340, bounds.top - 335], :width => 60, :height => 16) do
        text_box "Cash ", size: 16, style: :bold,:align => :right
        image "#{Rails.root}/images/check_false.jpg", :width => 14, :height => 14, :hposition => :center
       # transparent(0.5) { stroke_bounds }
      end
    end
  end


 def pair
    if(@post.Pair.to_f==1)
      text_box "PAIR ", size: 14, style: :bold, :align => :left, :at => [15, bounds.top - 2]
      image "#{Rails.root}/images/check_true.jpg", :width => 14, :height => 12, :hposition => :left
    end
    if(@post.Pair.to_f==0)
      text_box "PAIR ", size: 14, style: :bold, :align => :left, :at => [15, bounds.top - 2]
      image "#{Rails.root}/images/check_false.jpg", :width => 14, :height => 12, :hposition => :left
    end
  end    
   
  def air
    move_down 10
    if(@post.Air.to_f==1)
      text_box "AIR ", size: 14, style: :bold, :align => :left, :at => [15, bounds.top - shift]
      image "#{Rails.root}/images/check_true.jpg", :width => 14, :height => 12, :hposition => :left
    end
    if(@post.Air.to_f==0)
      text_box "AIR ", size: 14, style: :bold, :align => :left, :at => [15, bounds.top - shift]
      image "#{Rails.root}/images/check_false.jpg", :width => 14, :height => 12, :hposition => :left
    end
  end

  def acl
    move_down 10
    if(@post.Acl.to_f==1)
      text_box "ACL ", size: 14, style: :bold, :align => :left, :at => [15, bounds.top - (shift*2)]
      image "#{Rails.root}/images/check_true.jpg", :width => 14, :height => 12, :hposition => :left
    end
    if(@post.Acl.to_f==0)
      text_box "ACL ", size: 14, style: :bold, :align => :left, :at => [15, bounds.top - (shift*2)]
      image "#{Rails.root}/images/check_false.jpg", :width => 14, :height => 12, :hposition => :left
    end
  end

  def tccac
    move_down 10
    if(@post.Tc_cac.to_f==1)
      text_box "TC/CAC ", size: 14, style: :bold, :align => :left, :at => [15, bounds.top - (shift*3)+1]
      image "#{Rails.root}/images/check_true.jpg", :width => 14, :height => 12, :hposition => :left
    end
    if(@post.Tc_cac.to_f==0)
      text_box "TC/CAC ", size: 14, style: :bold, :align => :left, :at => [15,  bounds.top - (shift*3)+1]
      image "#{Rails.root}/images/check_false.jpg", :width => 14, :height => 12, :hposition => :left
    end
  end  

  def efe
    move_down 10
    if(@post.Efe.to_f==1)
      text_box "EFE ", size: 14, style: :bold, :align => :left, :at => [15,  bounds.top - (shift*4)-2]
      image "#{Rails.root}/images/check_true.jpg", :width => 14, :height => 12, :hposition => :left
    end
    if(@post.Efe.to_f==0)
      text_box "EFE ", size: 14, style: :bold, :align => :left, :at => [15,  bounds.top - (shift*4)+2]
      image "#{Rails.root}/images/check_false.jpg", :width => 14, :height => 12, :hposition => :left
    end
  end 
 
  def egr
    move_down 10
    if(@post.Egr.to_f==1)
      text_box "EGR ", size: 14, style: :bold, :align => :left, :at => [15,  bounds.top - (shift*5)+3]
      image "#{Rails.root}/images/check_true.jpg", :width => 14, :height => 12, :hposition => :left
    end
    if(@post.Egr.to_f==0)
      text_box "EGR ", size: 14, style: :bold, :align => :left, :at => [15,  bounds.top - (shift*5)+3]
      image "#{Rails.root}/images/check_false.jpg", :width => 14, :height => 12, :hposition => :left
    end
  end

  def can
    move_down 10
    if(@post.Can.to_f==1)
      text_box "CAN ", size: 14, style: :bold, :align => :left, :at => [15,  bounds.top - (shift*6)+4]
      image "#{Rails.root}/images/check_true.jpg", :width => 14, :height => 12, :hposition => :left
    end
    if(@post.Can.to_f==0)
      text_box "CAN ", size: 14, style: :bold, :align => :left, :at => [15,  bounds.top - (shift*6)+4]
      image "#{Rails.root}/images/check_false.jpg", :width => 14, :height => 12, :hposition => :left
    end
  end

  def cat
    move_down 10
    if(@post.Cat.to_f==1)
      text_box "CAT ", size: 14, style: :bold, :align => :left, :at => [15,  bounds.top - (shift*7)+5]
      image "#{Rails.root}/images/check_true.jpg", :width => 14, :height => 12, :hposition => :left
    end
    if(@post.Cat.to_f==0)
      text_box "CAT ", size: 14, style: :bold, :align => :left, :at => [15,  bounds.top - (shift*7)+5]
      image "#{Rails.root}/images/check_false.jpg", :width => 14, :height => 12, :hposition => :left
    end
  end

  def mil
    move_down 10
    if(@post.Mil.to_f==1)
      text_box "MIL ", size: 14, style: :bold, :align => :left, :at => [15,  bounds.top - (shift*8)+6]
      image "#{Rails.root}/images/check_true.jpg", :width => 14, :height => 12, :hposition => :left
    end
    if(@post.Mil.to_f==0)
      text_box "MIL ", size: 14, style: :bold, :align => :left, :at => [15,  bounds.top - (shift*8)+6]
      image "#{Rails.root}/images/check_false.jpg", :width => 14, :height => 12, :hposition => :left
    end
  end

  def o2s
    move_down 10
    if(@post.O2s.to_f==1)
      text_box "O2S ", size: 14, style: :bold, :align => :left, :at => [15,  bounds.top - (shift*9)+7]
      image "#{Rails.root}/images/check_true.jpg", :width => 14, :height => 12, :hposition => :left
    end
    if(@post.O2s.to_f==0)
      text_box "O2S ", size: 14, style: :bold, :align => :left, :at => [15,  bounds.top - (shift*9)+7]
      image "#{Rails.root}/images/check_false.jpg", :width => 14, :height => 12, :hposition => :left
    end
  end

  def pcv
    move_down 10
    if(@post.Pcv.to_f==1)
      text_box "PCV ", size: 14, style: :bold, :align => :left, :at => [15,  bounds.top - (shift*10)+8]
      image "#{Rails.root}/images/check_true.jpg", :width => 14, :height => 12, :hposition => :left
    end
    if(@post.Pcv.to_f==0)
      text_box "PCV ", size: 14, style: :bold, :align => :left, :at => [15, bounds.top - (shift*10)+8]
      image "#{Rails.root}/images/check_false.jpg", :width => 14, :height => 12, :hposition => :left
    end
  end

  def timing
    move_down 10
   if(@post.Timing.to_f==1)
      text_box "Timing ", size: 14, style: :bold, :align => :left, :at => [15,  bounds.top - (shift*11)+9]
      image "#{Rails.root}/images/check_true.jpg", :width => 14, :height => 12, :hposition => :left
    end
    if(@post.Timing.to_f==0)
      text_box "Timing ", size: 14, style: :bold, :align => :left, :at => [15,  bounds.top - (shift*11)+9]
      image "#{Rails.root}/images/check_false.jpg", :width => 14, :height => 12, :hposition => :left
    end
  end

  def casmog
    text "California Smog Inspection: #{price(@post.CASmog)}", size: 16, style: :bold, :align => :right
  end

  def cainsp
    text "California Smog Insp./ Heavy Duty Vehicles: #{price(@post.CAInsp)}", size: 16, style: :bold, :align => :right
  end

  def vin2
    text "V.I.N.: #{price(@post.VIN2)}", size: 16, style: :bold, :align => :right
  end

  def casmogcert    
    text "California Smog Certificate: #{price(@post.CASmogCert)}" , size: 16, style: :bold, :align => :right
  end

  def preinsp
      text "Pre-Inspection: #{@post.PreInsp}", size: 16, style: :bold, :align => :right
  end
  def reinsp
      text "Re-Inspection: #{@post.ReInsp}", size: 16, style: :bold, :align => :right 
  end
  def engcover
      text "Remove Eng. Cover (If Needed) Vans: #{@post.EngCover}", size: 16, style: :bold, :align => :right 
  end
  def other
     text "Other: #{@post.Other}", size: 16, style: :bold, :align => :right  
  end
  def evap
      text "Evap. Test: #{@post.Evap}", size: 16, style: :bold, :align => :right  
  end
  def est
      text "Estimates #{price(@post.Est)}", size: 16, style: :bold , :align => :right 
  end
  def gascap
      text "Gas Cap(s): #{@post.GasCap}", size: 16, style: :bold, :align => :right  
  end
  def mis
      text "Miscellaneous: #{@post.Mis}", size: 16, style: :bold, :align => :right  
  end
  def tax
      text "Tax: #{price(@post.TotalWtax-@post.Total)}", size: 16, style: :bold, :align => :right  
  end
  def total
      text "Total Before Tax: #{price(@post.Total)}", size: 16, style: :bold, :align => :right  
  end
  def totaltax
      text "Total: #{price(@post.TotalWtax)}", size: 20, style: :bold, :align => :right  
  end



  def clientnum
    bounding_box([bounds.right - 135, bounds.top - 150], :width => 100, :height => 30) do
      text_box "No. <color rgb='ff0000'>#{@post.Clientnum.to_i}</color> " ,:overflow => :truncate, size: 16, style: :bold, :inline_format => true
      #transparent(0.5) { stroke_bounds }
    end 
  end


  def price(num)
    @view.number_to_currency(num.to_i)
  end

  def box
   
  end
  def shift
    shift=23
  end  

  def totalsum
    sum=0
    sum+=@post.CASmog.to_f
    sum+=@post.CAInsp.to_f 
    sum+=@post.VIN2.to_f
    sum+=@post.CASmogCert.to_f 
    sum+=@post.PreInsp.to_f 
    sum+=@post.ReInsp.to_f 
    sum+=@post.EngCover.to_f 
    sum+=@post.Other.to_f 
    sum+=@post.Evap.to_f 
    sum+=@post.Est.to_f 
    sum+=@post.GasCap.to_f 
    sum+=@post.Mis.to_f 

    tax=sum * @post.Tax.to_f

    @post.Total = sum 

    @post.TotalWtax = sum + tax  
  end

  def date
    bounding_box([bounds.right-78, 17 ], :width => 100, :height => 12) do
      text_box "#{@post.created_at} " ,:overflow => :truncate, size: 12, style: :bold
    end
end

end