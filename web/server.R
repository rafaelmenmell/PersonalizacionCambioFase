

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    puntos <- 10
    puntos_output <- reactive({
        if(input$seguimiento1=="NO"){
            puntos <- puntos - 2
        }
        if(input$seguimiento2=="NO"){
            puntos <- puntos - 1
        }
        if(input$seguimiento3=="NO"){
            puntos <- puntos - 1
        }
        if(input$seguimiento6!="No se publican"){
            if(input$seguimiento6=="Más del 5%"){
                puntos <- puntos - 1
            }
            if(input$seguimiento6=="Más del 10%"){
                puntos <- puntos - 2
            }
        }
        if(input$seguimiento7!="No se publican"){
         if(input$seguimiento7=="SI"){
             puntos <- puntos - 2
         }
            }
        puntos <- puntos - input$seguimiento4
        puntos <- puntos - input$seguimiento5
        if(input$evolucion1=="SI"){
            puntos <- puntos - 2
        }
        if(input$evolucion2=="SI"){
            puntos <- puntos - 5
        }
        if(input$evolucion3=="SI"){
            puntos <- puntos - 2
        }
        if(input$evolucion4=="SI"){
            puntos <- puntos - 1
        }
        if(input$condiciones1==TRUE){
            puntos <- puntos - 2
        }
        if(input$condiciones2==TRUE){
            puntos <- puntos - 2
        }
        if(input$condiciones3==TRUE){
            puntos <- puntos + 5
        }
        if(input$condiciones4==TRUE){
            puntos <- puntos + 2
        }
        ri <- riesgo()
        if(ri>5){
            puntos <- puntos - 5
        }
        if(ri>=3 & ri<5){
            puntos <- puntos - 2.5
        }
        if(ri>1 & ri<3){
            puntos <- puntos - 1
        }
        puntos
    })
    
    riesgo <- reactive({
        risk <- 0
        if(input$personal1>80){
            risk <- risk + 3
        } else {
            if(input$personal1>65){
                risk <- risk + 2
            } else {
                if(input$personal1>50){
                    risk <- risk + 1
                }
            }
        }
        if(input$personal2==TRUE){
            risk <- risk + 2
        }
        if(input$personal3==TRUE){
            risk <- risk + 1
        }
        if(input$personal4==TRUE){
            risk <- risk + 1
        }
        if(input$personal5==TRUE){
            risk <- risk + 1
        }
        if(input$personal6==TRUE){
            risk <- risk + 1
        }
        if(input$personal7==TRUE){
            risk <- risk + 1
        }
        if(input$personal8==TRUE){
            risk <- risk + 3
        }
        if(input$personal9==TRUE){
            risk <- risk + 2
        }
        if(input$personal10==TRUE){
            risk <- risk + 1
        }
        if(input$personal11==TRUE){
            risk <- risk + 1
        }
        risk
        
    })
    
    output$puntos_output2 <- renderText({
        as.character(puntos_output())
    })
    
    output$texto_explicativo <- renderText({
        ptos_texto <- puntos_output()
        if(ptos_texto>5){
            texto <- "Adelante con el cambio de fase"
        } else {
            if(ptos_texto>0){
                texto <- "Una semana de demora"
            } else {
                texto <- "Una fase de demora"
            }
        }
        texto
    })
    
    output$advertencia <- renderImage({
        filename <- normalizePath("advertencia.png")
        
        # Return a list containing the filename and alt text
        list(src = filename,
             alt = paste("Image number", input$n))
    },deleteFile = FALSE)
})
