Vim�UnDo� t{j�L��}yB@O��R�;T�x6���b�   #       pres($user);            -       -   -   -    \��    _�                        C    ����                                                                                                                                                                                                                                                                                                                                                             \��     �                 Crequire( get_template_directory() . '/inc/woocommerce-setup.php' );5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             \��    �               �               5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             \�y     �                 }5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             \��     �                 add_action()5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             \��     �                 add_action('')5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             \��     �                 add_action('onlymembers')5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             \��     �                 add_action('onlymembers', '')5�_�      	                 1    ����                                                                                                                                                                                                                                                                                                                                                             \��     �                 1add_action('onlymembers', 'showloginsubscribers')5�_�      
           	      !    ����                                                                                                                                                                                                                                                                                                                                                             \��     �                 "function showloginsubscribers() {}5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                             \��     �                5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                             \��     �                   �             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       \��     �               "    $user = wp_get_current_user();   3if ( in_array( 'author', (array) $user->roles ) ) {   $    //The user has the "author" role   }5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       \��    �               &        $user = wp_get_current_user();5�_�                           ����                                                                                                                                                                                                                                                                                                                                         '       v   '    \��     �               (        //The user has the "author" role5�_�                           ����                                                                                                                                                                                                                                                                                                                                         '       v   '    \��     �                       5�_�                           ����                                                                                                                                                                                                                                                                                                                                         '       v   '    \��     �                       $user->roles[]5�_�                           ����                                                                                                                                                                                                                                                                                                                                         '       v   '    \��     �                       $user->roles[0]5�_�                           ����                                                                                                                                                                                                                                                                                                                                         '       v   '    \��     �                       $user->roles[0];5�_�                           ����                                                                                                                                                                                                                                                                                                                                         '       v   '    \��     �                       $user->roles[0];5�_�                           ����                                                                                                                                                                                                                                                                                                                                         '       v   '    \��     �                       $user->roles[0];5�_�                           ����                                                                                                                                                                                                                                                                                                                                         '       v   '    \��     �                       $user->roles[0];5�_�                           ����                                                                                                                                                                                                                                                                                                                                         '       v   '    \��     �                       $user->roles[0];5�_�                       %    ����                                                                                                                                                                                                                                                                                                                                         '       v   '    \��     �               %        $user_stat = $user->roles[0];5�_�                           ����                                                                                                                                                                                                                                                                                                                                         '       v   '    \�    �      !                  if() {}5�_�                           ����                                                                                                                                                                                                                                                                                                                                         '       v   '    \�    �         "      7    if ( in_array( 'author', (array) $user->roles ) ) {5�_�                           ����                                                                                                                                                                                                                                                                                                                                         '       v   '    \�H     �         "              if() {5�_�                           ����                                                                                                                                                                                                                                                                                                                                         '       v   '    \�N    �         "              if($user_stat == '') {5�_�                           ����                                                                                                                                                                                                                                                                                                                                         '       v   '    \�[    �         "      <    if ( in_array( 'subscribers', (array) $user->roles ) ) {5�_�                           ����                                                                                                                                                                                                                                                                                                                                         '       v   '    \�a    �          "              5�_�                           ����                                                                                                                                                                                                                                                                                                                                         '       v   '    \��     �          "                   5�_�                            ����                                                                                                                                                                                                                                                                                                                                         '       v   '    \��     �          "                 e 5�_�      !                      ����                                                                                                                                                                                                                                                                                                                                         '       v   '    \��     �          "      "           return do_shortcode(); 5�_�       "           !      !    ����                                                                                                                                                                                                                                                                                                                                         '       v   '    \��     �          "      $           return do_shortcode([]); 5�_�   !   #           "      !    ����                                                                                                                                                                                                                                                                                                                                         '       v   '    \��     �          "      &           return do_shortcode([]''); 5�_�   "   $           #           ����                                                                                                                                                                                                                                                                                                                                         '       v   '    \��    �          "      $           return do_shortcode(''); 5�_�   #   %           $           ����                                                                                                                                                                                                                                                                                                                                          !       v   !    \��   
 �          "      &           return do_shortcode('[]'); �          "    5�_�   $   &           %      "    ����                                                                                                                                                                                                                                                                                                                                          8       v   !    \�u     �         "      "    $user = wp_get_current_user();5�_�   %   (           &      	    ����                                                                                                                                                                                                                                                                                                                                            8       v   !    \�}    �         #          pres();5�_�   &   )   '       (           ����                                                                                                                                                                                                                                                                                                                                       "                   \��     �      !   #      =           return do_shortcode('[swpm_login_form level=2]'); 5�_�   (   *           )           ����                                                                                                                                                                                                                                                                                                                                       "                   \��     �      !   #      =           return do_shortcode('[swpm_login_form level=2]'); 5�_�   )   +           *           ����                                                                                                                                                                                                                                                                                                                                       "                   \��    �      !   #      =           return do_shortcode('[swpm_login_form level=2]'); 5�_�   *   ,           +          ����                                                                                                                                                                                                                                                                                                                                       "                   \��     �         #          pres($user);5�_�   +   -           ,          ����                                                                                                                                                                                                                                                                                                                                       "                   \��     �         #          pres($user);5�_�   ,               -          ����                                                                                                                                                                                                                                                                                                                                       "                   \��    �         #          pres($user);5�_�   &           (   '           ����                                                                                                                                                                                                                                                                                                                                       "                   \��    �         #      =//    if ( in_array( 'subscriber', (array) $user->roles ) ) {�      #   #      '//        $user_stat = $user->roles[0];   *//        if($user_stat == 'subscriber') {   ?//           return do_shortcode('[swpm_login_form level=2]');    //        }   //    }5��