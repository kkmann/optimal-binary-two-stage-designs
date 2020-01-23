library(shiny)
library(badr)

if (dir.exists("/home/jovyan/julia-1.3.1/bin")) options(JULIA_HOME = "/home/jovyan/julia-1.3.1/bin")

badr::load_julia_package()



server <- function(input, output) {

    prior <- reactive({
        (input$epsilon * badr::Beta(1, 1) + (1 - input$epsilon) * badr::Beta(input$a, input$b)) <= input$pmp
    })

    output$plt_prior <- renderPlot({
        p <- seq(0, 1, .001)
        plot(p, density(prior(), p))
    })

    design_ep <- reactive({withProgress(message = 'optimising expected power...', value = 1, {
        input$optimise
        isolate(
            Problem(
                minimise(SampleSize(prior())),
                Power(prior() %|% input$p0mrv[1]) <= .05,
                Power(prior() >=  input$p0mrv[2]) >= 1 - .2,
                unimodal = input$unimodal,
                label = 'EP design'
            ) %>%
            optimise_design()
        )
    })})

    output$plt_ep_design <- renderPlot({
        plot_compare_designs(design_ep(), annotations = input$p0mrv)
    })

    design_minimax <- reactive({withProgress(message = 'optimising minimax...', value = 1, {
        input$optimise_minimax
        isolate(
            Problem(
                minimise_maximal_sample_size(.2, PointMass(input$p01_minimax[2])),
                Power(prior() %|% input$p01_minimax[1]) <= .05,
                Power(prior() %|% input$p01_minimax[2]) >= 1 - .2,
                unimodal = input$unimodal,
                label = 'minimax design',
                maxmultipleonestage = 1.0
            ) %>%
            optimise_design()
        )
    })})

    output$plt_minimax_design <- renderPlot({
        plot_compare_designs(design_minimax(), annotations = input$p01_minimax)
    })

}
