configfile: "config/snakemake.yml"

import os
os.makedirs('output/figures', exist_ok = True)
os.makedirs('output/tables', exist_ok = True)





rule introduction:
    input:
        binomial_power    = "chapters/introduction/binomial-power-plot.R",
        binomial_vs_simon = "chapters/introduction/binomial-vs-simon-plot.R",
        recalculation     = "chapters/introduction/adaptive-recalculation.R"
    output:
        binomial_power    = "output/figures/binomial-power-plot.pdf",
        binomial_vs_simon = "output/figures/binomial-vs-simon-plot.pdf",
        recalculation_1   = "output/figures/adaptive-recalculation-designs.pdf",
        recalculation_2   = "output/figures/adaptive-recalculation-conditional-power.pdf"
    shell:
        """
        Rscript {input.binomial_power} {output.binomial_power} 7 4
        Rscript {input.binomial_vs_simon} {output.binomial_vs_simon} 7 7
        Rscript {input.recalculation} "output/figures/adaptive-recalculation" 7 7
        """





rule optimal_designs:
    input:
        simon_vs_optimal = "chapters/optimal-two-stage-designs/simon-vs-optimal.R",
        optimal_p0_p1_minimax = "chapters/optimal-two-stage-designs/optimal-null-alternative-minimax.R"
    output:
        simon_vs_optimal = "output/figures/simon-vs-optimal.pdf",
        optimal_p0_p1_minimax = "output/figures/optimal-null-alternative-minimax.pdf"
    shell:
        """
        Rscript {input.simon_vs_optimal} {output.simon_vs_optimal} 7 7
        Rscript {input.optimal_p0_p1_minimax} {output.optimal_p0_p1_minimax} 7 7
        """

rule solution_time:
    input:
        solution_time = "chapters/optimal-two-stage-designs/solution-time.R"
    output:
        solution_time = "output/figures/solution-time-plot.pdf"
    shell:
        """
        Rscript {input.solution_time} {output.solution_time} 7 3
        """





rule prior_choices:
    input:
        prior_effect = "chapters/prior-choice/prior-effect-on-designs.R"
    output:
        designs = "output/figures/prior-effect-on-designs.pdf",
        priors  = "output/figures/prior-effect-on-designs-priors.pdf"
    shell:
        """
        Rscript {input.prior_effect} "output/figures/prior-effect-on-designs" 7 7
        """

rule power_constraints:
    input:
        power_constraints = "chapters/prior-choice/power-constraints.R"
    output:
        "output/figures/power-constraints.pdf",
        "output/figures/power-constraints-distribution.pdf",
        "output/figures/power-constraints-power-vs-prior.pdf"
    shell:
        """
        Rscript {input.power_constraints} "output/figures/power-constraints" 7 7
        """

rule expected_power:
    input:
        expected_power = "chapters/prior-choice/expected-power.R"
    output:
        expected_power = "output/figures/expected-power.pdf"
    shell:
        """
        Rscript {input.expected_power} {output.expected_power} 7 7
        """

rule expected_utility:
    input:
        expected_utility = "chapters/prior-choice/expected-utility.R"
    output:
        "output/figures/expected-utility-optimisation.pdf",
        "output/figures/expected-utility-matched-design.pdf",
        "output/figures/expected-utility-alternative-scenarios.pdf"
    shell:
        """
        Rscript {input.expected_utility} "output/figures/expected-utility" 7 7
        """





rule posterior_mean:
    input:
        posterior_mean = "chapters/bayesian-inference/posterior-mean-comparison.R"
    output:
        "output/figures/posterior-mean-comparison.pdf",
        "output/figures/posterior-mean-comparison-jeffreys-by-design.pdf"
    shell:
        """
        Rscript {input.posterior_mean} "output/figures/posterior-mean-comparison" 7 8
        """

rule rbe_mle:
    input:
        rbe_mle = "chapters/frequentist-inference/rbe-mle.R"
    output:
        "output/figures/rbe-mle-bias-rmse.pdf",
        "output/figures/rbe-mle-pvalues.pdf",
        "output/figures/rbe-mle-intervals.pdf"
    shell:
        """
        Rscript {input.rbe_mle} "output/figures/rbe-mle" 7 8
        """

rule shan_design:
    input:
        shan_design = "chapters/frequentist-inference/shan-design.R"
    output:
        "output/figures/shan-design-performance.pdf",
        "output/figures/shan-design-compatibility.pdf",
        "output/figures/shan-design-mle-cmle-diff.pdf"
    shell:
        """
        Rscript {input.shan_design} "output/figures/shan-design" 7 8
        """


rule unplanned_adaptation:
    input:
        script = "chapters/unplanned-adaptation/scenario-1.R"
    output:
        "output/figures/unplanned-adaptation-base-design.pdf",
        "output/figures/unplanned-adaptation-modified-design-1.pdf"
    shell:
        """
        Rscript {input.script} "output/figures/unplanned-adaptation" 7 7
        """
