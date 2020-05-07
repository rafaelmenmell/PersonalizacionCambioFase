
library(shiny)

shinyUI(fluidPage(
    titlePanel("Personalización Cambio Fase COVID-19"),
    sidebarLayout(
        sidebarPanel(
            width = 6,
            tags$h3("Fiabilidad del seguimiento de la epidemia"),
            tags$div(),
            selectInput(
                inputId = "seguimiento1",
                label = "1. Se publica el número de test PCR diariamente o con retraso menor de 3 dias",
                choices = c("SI", "NO"),
                selected = "NO"
            ),
            selectInput(
                inputId = "seguimiento2",
                label = "2. Se publica el número de sanitarios dedicados para trazar casos",
                choices = c("SI", "NO"),
                selected = "NO"
            ),
            selectInput(
                inputId = "seguimiento3",
                label = "3. Se publican los tiempos entre síntomas y confirmación/aislamiento ",
                choices = c("SI", "NO"),
                selected = "NO"
            ),
            sliderInput(
                inputId = "seguimiento4",
                label = "4. Personas que nos comentan de primera mano que ha llamado con
síntomas y no le han cogido el teléfono o hecho el test",
                min = 0,
                max = 10,
                value = 0
            ),
            sliderInput(
                inputId = "seguimiento5",
                label = "5. Personas que sepamos de primera mano que ha dado positivo y no hayan
contactado y cuarentenado a sus contactos ",
                min = 0,
                max = 10,
                value = 0
            ),
            selectInput(
                inputId = "seguimiento6",
                label = "6. Test positivos al día (modificar sólo si se contestó SI en 1",
                choices = c("No se publican", "Menos del 5%","Más del 5%","Más del 10%"),
                selected = "NO se publican"
            ),
            selectInput(
                inputId = "seguimiento7",
                label = "7. El tiempo entre inicio síntomas y confirmación >3 días
o el tiempo entre inicio síntomas y aislamiento >5 días (sólo si contestó SI en 3)",
                choices = c("No se publican", "SI","NO"),
                selected = "NO se publican"
            ),
            tags$div(),
            tags$h3("Evolución de lo datos"),
            tags$div(),
            selectInput(
                inputId = "evolucion1",
                label = "1. Aumento de los casos en más de 3 días consecutivos",
                choices = c("SI", "NO"),
                selected = "NO"
            ),
            selectInput(
                inputId = "evolucion2",
                label = "2. Brote en provincia propia",
                choices = c("SI", "NO"),
                selected = "NO"
            ),
            selectInput(
                inputId = "evolucion3",
                label = "3. Brote en provincia adyacente",
                choices = c("SI", "NO"),
                selected = "NO"
            ),
            selectInput(
                inputId = "evolucion4",
                label = "4. Noticias de casos nuevos contagiados en residencias o centros sanitarios
que sugieran que no estaban bien controlados estos focos",
                choices = c("SI", "NO"),
                selected = "NO"
            ),
            tags$div(),
            tags$h3("Condiciones particulares"),
            tags$div(),
            checkboxInput(inputId="condiciones1","1. Eres personal sanitario",value = FALSE),
            checkboxInput(inputId="condiciones2","2. Convives con personas frágiles (de alto riesgo, >70 años)",value = FALSE),
            checkboxInput(inputId="condiciones3","3. Estas Inmunizado (IgG + )",value = FALSE),
            checkboxInput(inputId="condiciones4","4. Muy sugestivo haberlo pasado (anosmia, visto en urgencias todo indicaba pero
no test)",value = FALSE),
            tags$div(),
            tags$h3("Condiciones personales"),
            tags$div(),
            sliderInput(inputId="personal1",label = "1. Edad",min = 0,max = 100,value = 41),
            checkboxInput(inputId="personal2","2. Insuficiencia cardiaca, antecedente de infarto miocardio, arritmias",value = FALSE),
            checkboxInput(inputId="personal3","3. Hipertensión arterial",value = FALSE),
            checkboxInput(inputId="personal4","4. EPOC",value = FALSE),
            checkboxInput(inputId="personal5","5. Tabaquismo activo",value = FALSE),
            checkboxInput(inputId="personal6","6. Varón",value = FALSE),
            checkboxInput(inputId="personal7","7. Obesidad (Indice cintura/altura > 0,6 hombres y 0,55 mujeres)",value = FALSE),
            checkboxInput(inputId="personal8","8. Tumor en tratamiento quimioterápico activo",value = FALSE),
            checkboxInput(inputId="personal9","9. Inmunosuprimido “fuerte” (transplantado, monoclonales acabados en -mab, más de 2 fármacos para bajar defensas)",value = FALSE),
            checkboxInput(inputId="personal10","10. Inmunosuprimido leve (un solo fármaco, corticoides crónicos a dosis bajas)",value = FALSE),
            checkboxInput(inputId="personal11","11. Enfermedad autoinmune descontrolada con síntomas activos (inflamación no controlada)",value = FALSE),
        ),
        
        mainPanel(width = 4,
                  tabsetPanel(
                      tabPanel("Intrucciones",
                               helpText(   a("Enlace al vídeo GPS Fases Desescalada (v2.0) con instrucciones, autor: Dr. Iván Moreno",href="https://www.youtube.com/watch?v=5emyWxLWMyU&feature=youtu.be")
                               )),
                      tabPanel(
                          "Resultado",
                          textOutput("puntos_output2"),
                          tags$head(
                              tags$style("#puntos_output2{color: black;
                                 font-size: 90px;
                                 font-style: bold;
                                 }")
                          ),
                          textOutput("texto_explicativo"),
                          tags$head(
                              tags$style("#texto_explicativo{color: black;
                                 font-size: 15px;
                                 font-style: bold;
                                 }")
                          ),
                      ),
                      tabPanel("Advertencia",
                      imageOutput("advertencia"))
                  ))
    )
))
