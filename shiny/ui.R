ui <- navbarPage("",

    tabPanel("Background",
        h1("bla")
    ),

    tabPanel("Expected Power",
        sidebarLayout(
            sidebarPanel(
                actionButton("optimise", "optimise", width = "100%"),
                hr(),
                h4("Informative beta prior component"),
                p("define the parameters of an informative prior"),
                fluidRow(
                column(6, sliderInput("a",
                            withMathJax("$$a$$"),
                            min = 1,
                            max = 25,
                            value = 5)),
                column(6, sliderInput("b",
                            withMathJax("$$b$$"),
                            min = 1,
                            max = 25,
                            value = 10))
                ),
                h4("Null hypothesis and relevance threshold"),
                p("specify the upper boundary of the null hypothesis and the minimal clinically relevant response probability (expected power is only averaged over relevance region, i.e. probabilities larger than the minimal relevant value)"),
                fluidRow(
                    column(6, sliderInput("p0",
                                          withMathJax("$$p_0$$"),
                                          min = .1,
                                          max = .9,
                                          value = .2, step = .1)
                    ),
                    column(6, sliderInput("mrv",
                                          withMathJax("$$p_{MRV}$$"),
                                          min = .1,
                                          max = .9,
                                          value = .3, step = .1)
                    )
                ),
                h4("Prior robustification"),
                p("specify the weight of the non-informative uniform prior component and the maximal plausible response probability."),
                fluidRow(
                    column(6, sliderInput("epsilon",
                                          withMathJax("$$\\epsilon$$"),
                                          min = .0,
                                          max = 1.0,
                                          value = .2, step = .05)
                    ),
                    column(6, sliderInput("pmp",
                                          withMathJax("$$p_{max}$$"),
                                          min = .1,
                                          max = 1.0,
                                          value = .7, step = .1)
                    )
                ),
                h4("Unimodal sample size function?"),
                p("check this box to force the solution to have a unimodal sample size function; note: this increases the runtime."),
                checkboxInput("unimodal", "force unimodal?", value = FALSE)
            ),

            mainPanel(
                plotOutput("plt_prior"),
                plotOutput("plt_design")
            )
        )
    )
)
