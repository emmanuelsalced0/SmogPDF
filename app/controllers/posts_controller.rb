 class PostsController <ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]

  def new
    @post = Post.new
  end

  def edit
    
  end
  
  def update
    
    if @post.update(article_params)
      
      flash[:notice] = "Post was successfully updated"
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post was successfully Created"
      redirect_to post_path(@post)
    else
      render 'new'
    end 
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        pdf = PostPdf.new(@post, view_context)
        send_data pdf.render, filename: "#{@post.Veh_Year}, #{@post.Make} #{@post.Model}.pdf",
                              type: "appplication/pdf",
                              disposition: "inline"
      end
    end
  end

  def index
    @posts = Post.all
  end

  def destroy
    @post.destroy
    flash[:notice] = "Post Was Deleted"
    redirect_to posts_path
  end  

 
  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:Name, :Phone, :Adress, :Veh_Year, :Make, :Model, :LicPlate, :Miles, :VIN, :Visa, :MasterCard, :Discover, :Cash, :Pair, :Air, :Acl, :Tc_cac, :Efe, :Egr, :Can, :Cat, :Mil, :O2s, :Pcv, :Timing, :CASmog, :CAInsp, :VIN2, :CASmogCert, :PreInsp, :ReInsp, :EngCover, :Other, :Evap, :Est, :GasCap, :Mis, :Tax, :Clientnum)
    end 

  

end
