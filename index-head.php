<?php

return;

if ($sticky_page = cc_get_sticky_page()) {
			// grab attached image from sticky page and display it in the #splash area
			// this ignores any sticky blog posts
			// WARNING: if multiple pages are set sticky (show_on_index) the most 
			//          recently updated one will be used 
			if ($image = cc_get_attachment_image ($sticky_page->ID, 630)) {
			?>
			<a href="<?php echo get_permalink($sticky_page->ID); ?>?utm_source=ccorg&utm_medium=postbanner">
				<img src="<?php echo $image[0] ?>" alt="<?php echo $sticky_page->post_title; ?>" title="<?php echo $sticky_page->post_title; ?>" class="main" />
			</a>
			<?php
			}	
		} else {
            while (have_posts()) { 
              the_post(); 
              
              if (is_sticky() && in_category('splash')) { 
                if ($image = cc_get_attachment_image ($post->ID, 630)) { 
                 
                ?>
            <a href="<?php the_permalink() ?>?utm_source=ccorg&utm_medium=postbanner">
              <img src="<?php echo $image[0] ?>" alt="<?php the_title(); ?>" title="<?php the_title(); ?>" class="main" />
            </a>			
<?php
					$splash_attribution = get_post_meta($post->ID, "splash_attribution", true);
					if ($splash_attribution) {
						?><p class="attribution"><?php echo $splash_attribution ?></p><?php
					}	
                } // if get_attachment_image
                break;
              } // if is_sticky
			} // while
		}
?>

