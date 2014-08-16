<?php

$config['rules']['contact'] =  array(
                                    'name' => array(
                                            'field' => 'name',
                                            'label' => 'Name',
                                            'rules' => 'required'
                                         ),
                                    'email' => array(
                                            'field' => 'email',
                                            'label' => 'Email',
                                            'rules' => 'required|valid_email'
                                         ),
                                    'subject' => array(
                                            'field' => 'subject',
                                            'label' => 'Subject',
                                            'rules' => 'required'
                                         ),
                                    'message' => array(
                                            'field' => 'message',
                                            'label' => 'Message',
                                            'rules' => 'required'
                                         )
                                    );

$config['rules']['file'] =  array(
                  'upload_path'     => dirname($_SERVER["SCRIPT_FILENAME"])."/files/",
                  'upload_url'      => "files/",
                  'allowed_types'   => "gif|jpg|png|jpeg|pdf|doc|xml|zip|rar",
                  'overwrite'       => TRUE,
                  'max_size'        => "1000KB",
                  'max_height'      => "768",
                  'max_width'       => "1024"   
                );
$config['rules']['image'] =  array(
                  'upload_path'     => dirname($_SERVER["SCRIPT_FILENAME"])."/images/",
                  'upload_url'      => "images/",
                  'allowed_types'   => "gif|jpg|png|jpeg",
                  'overwrite'       => TRUE,
                  'max_size'        => "1000KB",
                  'max_height'      => "768",
                  'max_width'       => "1024"   
                );

$config['rules']['manipulation'] =  array(
                  'image_library'   => 'gd2',
                  'create_thumb'  =>  TRUE,
                  'maintain_ratio'  =>  FALSE,
                  'width'           =>  250,
                  'height'          =>  250,
                 
);