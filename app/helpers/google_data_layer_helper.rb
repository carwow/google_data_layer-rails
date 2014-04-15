module GoogleDataLayerHelper
  def google_data_layer_helper_hook
    'my_js_here'
  end

  def google_data_layer_information(page_name, page_type)
    @google_data_layer_page_name = page_name
    @google_data_layer_page_type = page_type
  end

  def google_data_layer_push_virtual_page_code
    virtual_page = flash[:data_layer_virtual_page_view_event]
    if virtual_page
      "googleDataLayerPushVirtualPageViewEvent('#{virtual_page}');"
    end
  end

  def google_data_layer_embed_code
    %Q{
      <script>
        var googleDataLayer = [{
          'ga_id': '#{GoogleDataLayer::Rails::Config.google_id}',
          'page_pageName': '#{@google_data_layer_page_name.to_s}',
          'page_pageType': '#{@google_data_layer_page_type.to_s}'
        }];

        var googleDataLayerPushVirtualPageViewEvent = function (pageName) {
          googleDataLayer.push({
            'page_virtualName': pageName,
            'event': 'gtm.view'
          });
        }
      </script>
    }.html_safe
  end

  def google_tag_manager_embed_code
    %q{
      <!-- Google Tag Manager -->
      <noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-57THDK"
      height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
      <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
      new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
      j=d.createElement(s),dl=l!='googleDataLayer'?'&l='+l:'';j.async=true;j.src=
      '//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
      })(window,document,'script','googleDataLayer','GTM-57THDK');</script>
      <!-- End Google Tag Manager -->
    }.html_safe
  end
end