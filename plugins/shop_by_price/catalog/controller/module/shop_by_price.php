<?php
/**
* shop_by_price Controller
* 
* @author liutao
* @package catalog/controller/module/
* @copyright Copyright 2012 Shawn R&D Team 
* @author manlianxiao3@126.com 
* @date 2012/02/22
* @version V1.0
* @todo 
*/
?>
<?php 
/**
 * 
 */
class ControllerModuleShopByPrice extends Controller {
	private $error = array();

	public function index() {
		//Language
		$this->language->load('module/shop_by_price');

		//Text
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		//Form POST	
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$min_price = floatval($this->request->post['min_price']);
			$max_price = floatval($this->request->post['max_price']);
			$this->redirect($this->url->link('product/category', 'path=' . $this->request->get['path'] . '&min_price='.$min_price.'&max_price='.$max_price));
		}

		//Model
		$this->load->model('catalog/category');

		//get current category id
		if ( isset($this->request->get['path']) ) {
			$parts = explode('_', (string)$this->request->get['path']);
			
			$current_category_id = array_pop($parts);
		} else {
			$current_category_id = 0;
		}
		
		//Data logic		
		$all_price_array = $this->model_catalog_category->getPriceRanges($current_category_id);
		//$all_price_array = array(
		//		array('price'=>'100.00', 'tax_class_id'=>'9'),
		//		array('price'=>'101.00', 'tax_class_id'=>'9'),
		//		array('price'=>'200.00', 'tax_class_id'=>'9'),
		//		array('price'=>'279.00', 'tax_class_id'=>'9'),
		//		array('price'=>'305.00', 'tax_class_id'=>'9'),
		//		array('price'=>'500.00', 'tax_class_id'=>'9'),
		//		array('price'=>'789.89', 'tax_class_id'=>'9'),
		//		array('price'=>'1000.00', 'tax_class_id'=>'9')
		//	);

		$price_interval_array = $this->getPriceIntervalArray($all_price_array);
		
		//Data
		$this->data['prices'] = $this->getShopByPriceData($price_interval_array);
		
		//Template
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/shop_by_price.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/shop_by_price.tpl';
		} else {
			$this->template = 'default/template/module/shop_by_price.tpl';
		}
		

		$this->render();

	}

	private function getShopByPriceData($price_interval) {
		$data = array();

		if( is_array($price_interval) && count($price_interval) > 0 ) {
			foreach($price_interval as $item) {
				$action = $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&min_price='.$item['min_price'].'&max_price='.$item['max_price']); 
				$title = $this->currency->format($item['min_price']) . ' - ' . $this->currency->format($item['max_price']);
				$data[] = array(
					'href'  => $action,
					'title' => $title
				);
			}
		}

		return $data;
	}

	private function getPriceIntervalArray($all_product_price_array) {
		$all_product_price_count = count($all_product_price_array);
		
		$price_interval = array();
		if ( $all_product_price_count > 0 ) {
			$interval_num = 5; //range num
			$min_price = floatval( $all_product_price_array[0]['price'] );
			$max_price = intval( (floatval( $all_product_price_array[$all_product_price_count-1]['price'] )*10 + 9 ) /10 );

			if ($max_price > $min_price) {
				$span = ($max_price - $min_price) / $interval_num;

				$start_price = floatval( $all_product_price_array[0]['price'] );
				$end_price = number_format($start_price + $span, 0, '.', '') + 0.99;

				$index = 0;
				for ($count = 0; $count < $interval_num; $count++) {
					//
					$has_product = false;
					while( $index < $all_product_price_count ) {
						$price = floatval( $all_product_price_array[$index]['price'] );
						if ( ($price >= $start_price) && ($price < $end_price) ) {
							$has_product = true;
							$index++;
							break;
						} elseif ( $price >= $end_price ) {
							break;
						}
						$index++;
					} //end while

					if ($has_product) {
						$price_interval[] = array(
												'min_price' => $start_price,
												'max_price' => $end_price
											);
					} //end if
					$start_price = $end_price;
					$end_price = number_format($end_price+$span, 0, '.', '') +0.99;
				}
			}
		}

		return $price_interval;
	}

	private function validate() {

		if ( !is_numeric($this->request->post['min_price']) || ($this->request->post['min_price'] == '') ) {
      		$this->error['min_price'] = $this->language->get('error_minprice');
    	}
		
    	if ( !is_numeric($this->request->post['max_price']) || ($this->request->post['max_price'] == '') ) {
      		$this->error['max_price'] = $this->language->get('error_maxprice');
    	}
		
    	if (!$this->error) {
      		return true;
    	} else {
      		return false;
    	}		
	}
}
?>
