module AreasHelper

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
	      description: 'description',
	      keywords: 'find,find999,f9,日本',
	      canonical: request.original_url,
	      separator: '|',
	      icon: [
	        { href: image_url('favicon.ico') },
	        { href: image_url('apple-touch-icon-180x180'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
	      ],
	      og: {
	        site_name: 'find999', # もしくは site_name: :site
	        title: :titlr, # もしくは title: :title
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
end
