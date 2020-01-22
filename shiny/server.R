library(shiny)
library(badr)
badr::load_julia_package()



server <- function(input, output) {

    prior <- reactive({
        (input$epsilon * badr::Beta(1, 1) + (1 - input$epsilon) * badr::Beta(input$a, input$b)) <= input$pmp
    })

    output$plt_prior <- renderPlot({
        p <- seq(0, 1, .001)
        plot(p, density(prior(), p))
    })

    # design <- reactive({
    #     input$optimise
    #     isolate(
    #         Problem(
    #             minimise(SampleSize(prior())),
    #             Power(prior() %|% input$p0) <= .05,
    #             Power(prior() >= input$mrv) >= 1 - .2,
    #             unimodal = input$unimodal
    #         ) %>%
    #         optimise_design()
    #     )
    # })

    # output$plt_design <- renderPlot({
    #     plot_compare_designs(design(), annotations = c(input$p0, input$mrv))
    # })

}
