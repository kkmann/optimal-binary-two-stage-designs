ui <- navbarPage("",

    tabPanel("Background",
        h1("bla")
    ),

    tabPanel("Try it out!",
        # Sidebar with a slider input for number of bins
        sidebarLayout(
            sidebarPanel(
                fluidRow(
                column(6, sliderInput("a",
                            "a",
                            min = 1,
                            max = 25,
                            value = 5)),
                column(6, sliderInput("b",
                            "b",
                            min = 1,
                            max = 25,
                            value = 10))
                ),
                fluidRow(
                    column(6, sliderInput("p0",
                                          "response probability under the null",
                                          min = .1,
                                          max = .9,
                                          value = .2, step = .1)
                    ),
                    column(6, sliderInput("mrv",
                                          "MRV",
                                          min = .1,
                                          max = .9,
                                          value = .3, step = .1)
                    )
                ),
                fluidRow(
                    column(6, sliderInput("epsilon",
                                          "non-informative weight",
                                          min = .0,
                                          max = 1.0,
                                          value = .2, step = .05)
                    ),
                    column(6, sliderInput("pmp",
                                          "maximal plausible response probability",
                                          min = .1,
                                          max = 1.0,
                                          value = .7, step = .1)
                    )
                ),
                checkboxInput("unimodal", "force unimodal?", value = FALSE),
                actionButton("optimise", "optimise")
            ),

            mainPanel(
                plotOutput("distPlot"),
                plotOutput("designPlot")
            )
        )
    )
)
