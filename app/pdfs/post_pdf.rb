class PostPdf < Prawn::Document
  def initialize(post, view)
    super(top_margin: 70)
    @post = post
    @view= view
    post_name
    line_items
    
  end


  def post_name
    text "Name: #{@post.Name}", size: 20, style: :bold
  end

  def line_items
    move_down 20
   text "Phone: #{@post.Phone}", size: 20, style: :bold
  end

  def price(num)
    @view.number_to_currency(num)
  end  
end