module ApplicationHelper

  def title
    title = @title
  end  

  def page
    title = @page
  end

  def default_meta_tags
	    {
	      site: 'F9',
	      reverse: true,
	      charset: 'utf-8',
	      description: 'FIND999 ファインド999 シンプルなレイアウト 日本のお店のウィキペディア | find999 Simple Layout Japan Shop’s Wikipedia',
	      keywords: 'find,find999,f9,日本',
	      canonical: request.original_url,
	      separator: '|',
	      icon: [
	        { href: image_url('favicon.ico') },
	        { href: image_url('apple-touch-icon-180x180'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
	      ],
	      og: {
	        site_name: 'find999', # もしくは site_name: :site
	        description: 'description', # もしくは description: :description
	        type: 'website',
	        url: request.original_url,
	        image: image_url('template/logo0.gif'),
	        locale: 'ja_JP',
	      },
	      twitter: {
	        card: 'summary',
	        site: '@FIND98831770',
	      }
	    }
	end

	def devise_error_messages
		return "" if resource.errors.empty?
			html = ""
			# エラーメッセージ用のHTMLを生成
			messages = resource.errors.full_messages.each do |msg|
			html += <<-EOF
			<div class="error_field alert alert-danger" role="alert">
			<p class="error_msg">#{msg}</p>
			</div>
			EOF
		end
			html.html_safe
	end

end