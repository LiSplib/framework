<?php

$config = [
    'app.namespace' => 'App',
    'mvc.routes' => [
        'home' => [
            'controller' => 'Home',
            'view' => 'pages/home.phtml'
        ],
        'connect' => [
            'controller' => 'Connect',
            'view' => 'add/connect.phtml'
        ],
        'logout' => [
            'controller' => 'Logout',
            'view' => 'pages/home.phtml'
        ],
        'account' => [
            'controller' => 'Account',
            'view' => 'pages/account.phtml'
        ],
        'parameter' => [
            'controller' => 'Parameter',
            'view' => 'admin/parameter.phtml'
        ], 
        'calendar' => [
            'controller' => 'Calendar',
            'view' => 'pages/calendar.phtml'
        ],
        'addEvent' => [
            'controller' => 'AddEvent',
            'view' => 'add/addEvent.phtml'
        ],
        'editEvent' => [
            'controller' => 'EditEvent',
            'view' => 'pages/editEvent.phtml'
        ],
        'currentEvent' => [
            'controller' => 'CurrentEvent',
            'view' => 'pages/currentEvent.phtml'
        ],
        'delete' => [
            'controller' => 'Delete',
            'view' => 'pages/delete.phtml'
        ],
        'rs' => [
            'controller' => 'Rs',
            'view' => 'pages/rs.phtml'
        ],
        'facebook' => [
            'controller' => 'FacebookPage',
            'view' => 'pages/facebook.phtml'
        ],
        'facebookLive' => [
            'controller' => 'FacebookLive',
            'view' => 'pages/liveFacebook.phtml'
        ],
        'socialMedia' => [
            'controller' => 'SocialMedia',
            'view' => 'admin/socialMedia.phtml'
        ],
        'register' => [
            'controller' => 'Register',
            'view' => 'add/addAdmin.phtml'
        ],
        'members' => [
            'controller' => 'Members',
            'view' => 'admin/members.phtml'
        ],
        'registerEvent' => [
            'controller' => 'CurrentEvent',
            'view' => 'pages/currentEvent.phtml'
        ],
        'myEvents' => [
            'controller' => 'MyEvents',
            'view' => 'pages/myEvents.phtml'
        ],
        'search' => [
            'controller' => 'Search',
            'view' => 'pages/search.phtml'
        ],
        'adminEdit' => [
            'controller' => 'AdminEdit',
            'view' => 'admin/adminEdit.phtml'
        ],
        'imageResize' => [
            'controller' => 'ImageResizer',
            'view' => 'admin/adminImage.phtml'
        ],
        'coaching' => [
            'controller' => 'Coaching',
            'view' => 'admin/adminCoaching.phtml'
        ],
        'fullAccount' => [
            'controller' => 'FullAccount',
            'view' => 'pages/fullAccount.phtml'
        ],
        'instagram' => [
            'controller' => 'Instagram',
            'view' => 'pages/instagram.phtml'
        ]
    ],
];