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
                sliderInput("p0mrv",
                    withMathJax("$$p_0 \\quad \\text{and} \\quad p_{MRV}$$"),
                    min = .1, max = .9, step = .05,
                    value = c(.2, .3)

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
                plotOutput("plt_ep_design")
            )
        )
    ),

    tabPanel("MiniMax",
             sidebarLayout(
                 sidebarPanel(
                     actionButton("optimise_minimax", "optimise", width = "100%"),
                     hr(),
                     h4("Null and alternative hypotheses"),
                     p("specify the upper boundary of the null hypothesis and the minimal clinically relevant response probability (expected power is only averaged over relevance region, i.e. probabilities larger than the minimal relevant value)"),
                     sliderInput("p01_minimax",
                                 withMathJax("$$p_0 \\quad \\text{and} \\quad p_{alt}$$"),
                                 min = .1, max = .9, step = .05,
                                 value = c(.2, .4)

                     ),
                     h4("Unimodal sample size function?"),
                     p("check this box to force the solution to have a unimodal sample size function; note: this increases the runtime."),
                     checkboxInput("unimodal_minimax", "force unimodal?", value = FALSE)
                 ),

                 mainPanel(
                     plotOutput("plt_minimax_design")
                 )
             )
    )

)
