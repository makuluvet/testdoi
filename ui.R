library(shiny)
library(shinydashboard)
library(dashboardthemes)
library(leaflet)

theme_BL <- shinyDashboardThemeDIY(
    #--- Theme -----
    ### general
    appFontFamily = "Century Gothic"
    ,appFontColor = "rgb(0,0,0)"
    ,primaryFontColor = "rgb(255, 255, 255)"
    ,infoFontColor = "rgb(255, 255, 255)"
    ,successFontColor = "rgb(255, 255, 255)"
    ,warningFontColor = "rgb(255, 255, 255)"
    ,dangerFontColor = "rgb(255, 255, 255)"
    ,bodyBackColor = "rgb(255, 255, 255)"
    
    ### header
    ,logoBackColor = "rgb(64,20, 8)"
    
    ,headerButtonBackColor = "rgb(64,20, 8)"
    ,headerButtonIconColor = "rgb(191, 191, 191)"
    ,headerButtonBackColorHover = "rgb(64,20, 8)"
    ,headerButtonIconColorHover = "rgb(255, 255, 255)"
    
    ,headerBackColor = "rgb(64,20, 8)"
    ,headerBoxShadowColor = NA#"#aaaaaa"
    ,headerBoxShadowSize = "2px 2px 2px"
    
    ### sidebar
    ,sidebarBackColor = "rgb(255,255,255)"
    ,sidebarPadding = 0
    
    ,sidebarMenuBackColor = "transparent"
    ,sidebarMenuPadding = 0
    ,sidebarMenuBorderRadius = 0
    
    ,sidebarShadowRadius = "3px 5px 5px"
    ,sidebarShadowColor = "#aaaaaa"
    
    ,sidebarUserTextColor = "rgb(0,132,85)"
    
    ,sidebarSearchBackColor = "rgb(0,0,0)"
    ,sidebarSearchIconColor = "rgb(244,221,167)"
    ,sidebarSearchBorderColor = NA#"rgb(55,72,80)"
    
    ,sidebarTabTextColor = "rgb(0,132,85)"
    ,sidebarTabTextSize = 13
    ,sidebarTabBorderStyle = "none none none none"
    ,sidebarTabBorderColor = NA#"rgb(0,98, 50)"
    ,sidebarTabBorderWidth = 0
    
    ,sidebarTabBackColorSelected = "rgb(0,98,50)"
    ,sidebarTabTextColorSelected = "rgb(255,255,255)"
    ,sidebarTabRadiusSelected = "0px 20px 20px 0px"
    
    ,sidebarTabBackColorHover = "rgb(244,221, 167)"
    ,sidebarTabTextColorHover = "rgb(0,132,85)"
    ,sidebarTabBorderStyleHover = "none none solid none"
    ,sidebarTabBorderColorHover = "rgb(75,126,151)"
    ,sidebarTabBorderWidthHover = 0
    ,sidebarTabRadiusHover = "0px 20px 20px 0px"
    
    ### boxes
    ,boxBackColor = "rgb(255,255,255)"
    ,boxBorderRadius = 10
    ,boxShadowSize = "0px 0px 0px"
    ,boxShadowColor = "rgba(0,0,0,.1)"
    ,boxTitleSize = 13
    ,boxDefaultColor = "rgb(41, 64, 53)"
    ,boxPrimaryColor = "rgb(0, 98, 50)"
    ,boxInfoColor = "rgb(49, 98, 0)"
    ,boxSuccessColor = "rgba(0, 88, 153)"
    ,boxWarningColor = "rgb(126, 60, 118)"
    ,boxDangerColor = "rgb(145, 53, 62)"
    
    ,tabBoxTabColor = "rgb(255,255,255)"
    ,tabBoxTabTextSize = 13
    ,tabBoxTabTextColor = "rgb(0,0,0)"
    ,tabBoxTabTextColorSelected = "rgb(0,0,0)"
    ,tabBoxBackColor = "rgb(255,255,255)"
    ,tabBoxHighlightColor = "rgba(44,222,235,1)"
    ,tabBoxBorderRadius = 5
    
    ### inputs
    ,buttonBackColor = "rgb(245,245,245)"
    ,buttonTextColor = "rgb(0,0,0)"
    ,buttonBorderColor = "rgb(200,200,200)"
    ,buttonBorderRadius = 5
    
    ,buttonBackColorHover = "rgb(235,235,235)"
    ,buttonTextColorHover = "rgb(100,100,100)"
    ,buttonBorderColorHover = "rgb(200,200,200)"
    
    ,textboxBackColor = "rgb(255,255,255)"
    ,textboxBorderColor = "rgb(200,200,200)"
    ,textboxBorderRadius = 5
    ,textboxBackColorSelect = "rgb(245,245,245)"
    ,textboxBorderColorSelect = "rgb(200,200,200)"
    
    ### tables
    ,tableBackColor = "rgb(255,255,255)"
    ,tableBorderColor = "rgb(240,240,240)"
    ,tableBorderTopSize = 1
    ,tableBorderRowSize = 1
    #-----------------------------------------------------------------------------
)
#----------




shinyUI(
    dashboardPage(
        title = "African Wild Dog Conservation",
        # skin = "black",
        
        header = dashboardHeader(title = strong(""),
                                 dropdownMenu()),
        
        sidebar = dashboardSidebar(collapsed = T,
                                   sidebarMenu(
                                       menuItem("Map", tabName = "map", icon = icon("map")),
                                       menuItem("Metrics", tabName = "metrics", icon = icon("thermometer-half")),
                                       menuItem("Contact Network", tabName = "contact", icon = icon("connectdevelop")),
                                       menuItem("Collars", tabName = "collars", icon = icon("creative-commons-sampling")),
                                       menuItem("About", tabName = "about", icon = icon("info"))
                                       
                                   ),
                                   # textOutput("time"),
                                   
                                   uiOutput("DateSelect")#,
                                   
                                   # tags$footer(a(img(src = "BL Logo.png", width = "100%"),href="https://www.boucherlegacy.co.za/"), align = "center", style = "position:absolute;bottom:0;")
                                   
        ),
        
        body = dashboardBody(theme_BL,
                             tabItems(
                                 tabItem(
                                     tabName = "map",
                                     fluidPage(
                                         absolutePanel(
                                             top = 50,
                                             left = 0,
                                             right = 0,
                                             bottom = 0,
                                             leafletOutput("basemap", width = "100%", height = "100%")
                                         )
                                     )
                                     # box(
                                     #     width = 6,
                                     #     height = "90vh",
                                     #     title = "Alarms",
                                     #     status = "danger",
                                     #     solidHeader = TRUE,
                                     #     collapsible = F
                                     # ),
                                     # box(
                                     #     width = 6,
                                     #     height = "90vh",
                                     #     title = "Map",
                                     #     status = "success",
                                     #     solidHeader = T,
                                     #     collapsible = F,
                                     #     fluidPage(
                                     #         absolutePanel(
                                     #             top = 50,
                                     #             left = 0,
                                     #             right = 0,
                                     #             bottom = 0,
                                     #             leafletOutput("basemap", width = "100%", height = "100%")
                                     #         )
                                     #     )
                                     # )
                                 ),
                                 tabItem(
                                     tabName = "metrics",h2("Threat metrics")
                                 ),
                                 
                                 tabItem(
                                     tabName = "contact",h2("Contact network")
                                 ),
                                 
                                 tabItem(
                                     tabName = "collars",h2("Collar status")
                                 ),
                                 
                                 tabItem(
                                     tabName = "about",
                                     HTML(paste0("<center>", h2("Created by"),"<br>",
                                                 "<center>",
                                                 a(img(src = "EWT_logo.png", height = "120px"),href="https://www.ewt.org.za/"),"     ",
                                                 a(img(src = "jdatalogo.png", height = "120px"),href="https://www.jdata.co.za/"),
                                                 "<br>",
                                                 "<br>",
                                                 
                                                 h2("Funding"),"<br>",
                                                 a(img(src = "BL Logo.png", height = "160px"),href="https://www.boucherlegacy.co.za/"),"     ",
                                                 a(img(src = "oak_logo.jpg", height = "160px"),href="https://oakfnd.org/")
                                                 
                                     )
                                     )
                                 ))
                             )
        
    )
)
