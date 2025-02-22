library(shiny)
library(waiter)

ui <- fluidPage(
	use_waiter(),
	show_waiter_on_load(spin_fading_circles()),
	div(
		class = "container",
		style = "margin-top:400px;",
		fluidRow(
			column(3, sliderInput("seconds", "Seconds", min = 3, max = 7, value = 4, width = "100%")),
			column(
				3,
				selectInput(
					"spinner",
					"Spinner",
					choices = c(
						"Fading circle" = "spin_fading_circles",
						"Folding cube" = "spin_folding_cube",
						"Double bounce" = "spin_double_bounce",
						"Wave" = "spin_wave",
						"Wandering Cubes" = "spin_wandering_cubes",
						"Pulse" = "spin_pulse",
						"Chasing dots" = "spin_chasing_dots",
						"3 bounce" = "spin_three_bounce",
						"Circle" = "spin_circle",
						"Cube grid" = "spin_cube_grid",
						"Circles" = "spin_circles",
						"Dual Ring" = "spin_dual_ring",
						"Heart" = "spin_heart",
						"Ellipsis" = "spin_ellipsis",
						"Facebook" = "spin_hourglass",
						"Ring" = "spin_ring",
            "Ripple" = "spin_ripple",
            "Rotate" = "spin_rotate",
            "Squares" = "spin_squares",
            "Solar" = "spin_solar",
            "Orbit" = "spin_orbit"
					)
				)
			),
			column(3, textInput("text", "Text", "Loading...", width = "100%")),
			column(3, br(), actionButton("trigger", "Show", class = "btn-primary", width = "100%"))
		)
	)
)

server <- function(input, output, session) {
	hide_waiter()
  observeEvent(input$trigger, {

		spinner <- eval(parse(text = paste0(input$spinner, "()")))

    show_waiter(
			tagList(
				spinner,
				br(),
				span(input$text, style = "color:white;")
			)
		)
    Sys.sleep(input$seconds)
    hide_waiter()
  })
}

shinyApp(ui, server)

