return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"leoluz/nvim-dap-go",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("dap-go").setup()
			dapui.setup()

			require("nvim-dap-virtual-text").setup()

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			-- vim.keymap.set("n", "<F5>", dap.continue, { desc = "[D]ebug Continue" })
			-- vim.keymap.set("n", "<F10>", dap.step_over, { desc = "[D]ebug Step Over" })
			-- vim.keymap.set("n", "<F11>", dap.step_into, { desc = "[D]ebug Step Into" })
			-- vim.keymap.set("n", "<F12>", dap.step_out, { desc = "[D]ebug Step Out" })
			-- vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { desc = "[D]ebug Toggle Breakpoint" })
			-- vim.keymap.set("n", "<Leader>B", dap.set_breakpoint, { desc = "[D]ebug Set Breakpoint" })

			vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "[D]ebug [C]ontinue" })
			vim.keymap.set("n", "<Leader>do", dap.step_over, { desc = "[D]ebug Step [O]ver" })
			vim.keymap.set("n", "<Leader>di", dap.step_into, { desc = "[D]ebug Step [I]nto" })
			vim.keymap.set("n", "<Leader>dx", dap.step_out, { desc = "[D]ebug Step Out (e[X]it)" })
			vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "[D]ebug Toggle [B]reakpoint" })
			vim.keymap.set("n", "<Leader>dB", dap.set_breakpoint, { desc = "[D]ebug Set [B]reakpoint" })
			-- vim.keymap.set("n", "<Leader>lp", dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")))
			vim.keymap.set("n", "<Leader>dr", dap.repl.open, { desc = "[D]ebug Open [R]EPL" })
			vim.keymap.set("n", "<Leader>dl", dap.run_last, { desc = "[D]ebug Run [L]ast" })

			vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
				require("dap.ui.widgets").hover()
			end, { desc = "[D]ebug UI Widgets [H]over" })
			vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
				require("dap.ui.widgets").preview()
			end, { desc = "[D]ebug UI Widgets [P]review" })
			vim.keymap.set("n", "<Leader>df", function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.frames)
			end, { desc = "[D]ebug UI Widgets Center [F]rames" })
			vim.keymap.set("n", "<Leader>ds", function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.scopes)
			end, { desc = "[D]ebug UI Widgets Center [S]copes" })

			vim.keymap.set(
				"n",
				"<Leader>dt",
				dapui.toggle,
				-- ":DapUiToggle<CR>",
				{ noremap = true, desc = "[D]ebug UI [T]oggle" }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>dr",
				":lua require('dapui').open({reset = true})<CR>",
				{ noremap = true, desc = "[D]ebug UI [R]eset" }
			)
		end,
	},
}
