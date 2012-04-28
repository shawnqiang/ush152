<?php

class ControllerModuleUsweethome extends Controller {
    
    private $error = array(); 
    
    public function index() {   
        //Load the language file for this module
        $language = $this->load->language('module/usweethome');
        $this->data = array_merge($this->data, $language);

        //Set the title from the language file $_['heading_title'] string
        $this->document->setTitle($this->language->get('heading_title'));
        
        //Load the settings model. You can also add any other models you want to load here.
        $this->load->model('setting/setting');
        
        $this->load->model('tool/image');    
        
        //Save the settings if the user has submitted the admin form (ie if someone has pressed save).
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('usweethome', $this->request->post);    
               
                    
            $this->session->data['success'] = $this->language->get('text_success');
        
                        
            $this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }
        
            $this->data['text_image_manager'] = 'Image manager';
                    $this->data['token'] = $this->session->data['token'];       

            $this->data['usweethome_footer_info_text'] = $this->language->get('usweethome_footer_info_text');
        
        $text_strings = array(
                'heading_title',
                'text_enabled',
                'text_disabled',
                'text_content_top',
                'text_content_bottom',
                'text_column_left',
                'text_column_right',
                'entry_status',
                'entry_sort_order',
                'button_save',
                'button_cancel',
        );
        
        foreach ($text_strings as $text) {
            $this->data[$text] = $this->language->get($text);
        }
        

        // store config data
        
        $config_data = array(

        'usweethome_status',

        'usweethome_background_color',
        'usweethome_thickbar_color',
        'usweethome_title_color',
        'usweethome_bodytext_color',
        'usweethome_lighttext_color',
        'usweethome_menu_color',
        'usweethome_links_color',

        'usweethome_button_top_color',
        'usweethome_button_bottom_color',
        'usweethome_button_border_color',
        'usweethome_button_text_color',

        'usweethome_2button_top_color',
        'usweethome_2button_bottom_color',
        'usweethome_2button_border_color',
        'usweethome_2button_text_color',        

        'usweethome_pattern_overlay',
        'usweethome_custom_image',
        'usweethome_custom_pattern',
        'usweethome_image_preview',
        'usweethome_pattern_preview',
        
        'usweethome_title_font',
        'usweethome_body_font',
        'usweethome_small_font',

        'usweethome_facebook_id',
        'usweethome_twitter_username',
        'usweethome_gplus_id',
        'usweethome_pinterest_id',

        'usweethome_footer_info_text',

        'usweethome_copyright',

        'usweethome_cloud_zoom',
        'usweethome_display_shadows'

        );
        
        foreach ($config_data as $conf) {
            if (isset($this->request->post[$conf])) {
                $this->data[$conf] = $this->request->post[$conf];
            } else {
                $this->data[$conf] = $this->config->get($conf);
            }
        }
    
        //This creates an error message. The error['warning'] variable is set by the call to function validate() in this controller (below)
        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }
        
        //Set up breadcrumb trail.
        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_module'),
            'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );
        
        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link('module/usweethome', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );
        
        $this->data['action'] = $this->url->link('module/usweethome', 'token=' . $this->session->data['token'], 'SSL');
        
        $this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
                
        $this->load->model('design/layout');
        
        $this->data['layouts'] = $this->model_design_layout->getLayouts();

        $this->load->model('localisation/language');
        
        $this->data['languages'] = $this->model_localisation_language->getLanguages();
        
        if (isset($this->request->post['usweethome_module'])) {
            $this->data['usweethome_module'] = $this->request->post['usweethome_module'];
        } else {
            $this->data['usweethome_module'] = $this->config->get('usweethome_module');
        }

        //Choose which template file will be used to display this request.
        $this->template = 'module/usweethome.tpl';
        $this->children = array(
            'common/header',
            'common/footer',
        );

        if (isset($this->data['usweethome_custom_pattern']) && $this->data['usweethome_custom_pattern'] != "" && file_exists(DIR_IMAGE . $this->data['usweethome_custom_pattern'])) {
            $this->data['usweethome_pattern_preview'] = $this->model_tool_image->resize($this->data['usweethome_custom_pattern'], 70, 70);
        } else {
            $this->data['usweethome_pattern_preview'] = $this->model_tool_image->resize('no_image.jpg', 70, 70);
        }
        
        
        if (isset($this->data['usweethome_custom_image']) && $this->data['usweethome_custom_image'] != "" && file_exists(DIR_IMAGE . $this->data['usweethome_custom_image'])) {
            $this->data['usweethome_image_preview'] = $this->model_tool_image->resize($this->data['usweethome_custom_image'], 70, 70);
        } else {
            $this->data['usweethome_image_preview'] = $this->model_tool_image->resize('no_image.jpg', 70, 70);
        }

        $this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 70, 70);

        //Send the output.
        $this->response->setOutput($this->render());
    }
    
    /*
     * 
     * This function is called to ensure that the settings chosen by the admin user are allowed/valid.
     * You can add checks in here of your own.
     * 
     */
    
    private function validate() {
        if (!$this->user->hasPermission('modify', 'module/usweethome')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
        
        if (!$this->error) {
            return TRUE;
        } else {
            return FALSE;
        }   
    }


}
?>