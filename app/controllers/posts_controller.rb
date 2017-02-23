 class PostsController <ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]
  before_action :set_notindex, only: [:new,:edit, :update, :create, :show, :destroy, :index]

  def new
    @post = Post.new
  end

  def edit
  end
  
  def update
    if @post.update(post_params)
      flash[:sucess] = "Post was successfully updated"
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end
  
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:sucess] = "Post was successfully Created"

      redirect_to post_path(@post)
    else
      render 'new'
    end 
  end

  def show
    set_clientnum(@post.user)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = PostPdf.new(@post, view_context)
        send_data pdf.render, 
          type: 'application/pdf', 
          filename: "#{I18n.l(@post.created_at, format: "%m.%d.%y").to_s}, #{@post.Name}.pdf"
      end
    end
  end

  def index
    @posts = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end
   
  def destroy
    @post.destroy
    redirect_to posts_path
    flash[:danger] = "Post Was Deleted"
  end  

 
  private
    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:Name, :Phone, :Adress, :Veh_Year, :Make, :Model, :LicPlate, :Miles, :VIN, :Visa, :MasterCard, :Discover, :Cash, :Pair, :Air, :Acl, :Tc_cac, :Efe, :Egr, :Can, :Cat, :Mil, :O2s, :Pcv, :Timing, :CASmog, :CAInsp, :VIN2, :CASmogCert, :PreInsp, :ReInsp, :EngCover, :Other, :Evap, :Est, :GasCap, :Mis, :Tax, :Clientnum)
    end 
    
    def set_notindex
    @notindex=true
    end

    def set_clientnum(user)
      id = @post.id
      @post.Clientnum= id.to_i + user.number.to_i
    end 


end
