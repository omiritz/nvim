-- ================================
-- Plugin: Obsidian Daily Notes
-- Auto-abre a nota diária ao entrar no diretório Obsidian
-- ================================

return {
	-- Plugin local (não precisa de repo remoto)
	dir = vim.fn.expand("~/AppData/Local/nvim/lua/plugins"),
	name = "obsidian-daily",
	enabled = true,
	lazy = false, -- Carrega no startup para detectar o diretório

	config = function()
		local M = {}

		-- ================================
		-- Configuração
		-- ================================
		M.config = {
			obsidian_dir = vim.fn.expand("~/OneDrive - Sicoob/Obsidian"),
			daily_notes_dir = "when",
			template_file = "Templates/Template - Diário.md",
			date_format = "%d-%m-%Y",
		}

		-- ================================
		-- Funções Auxiliares
		-- ================================

		-- Obtém o caminho da nota do dia
		local function get_daily_note_path()
			local year = os.date("%Y")
			local month = os.date("%m")
			local filename = os.date(M.config.date_format) .. ".md"

			return string.format(
				"%s/%s/%s/%s/%s",
				M.config.obsidian_dir,
				M.config.daily_notes_dir,
				year,
				month,
				filename
			)
		end

		-- Cria diretórios se não existirem
		local function ensure_dir_exists(filepath)
			local dir = vim.fn.fnamemodify(filepath, ":h")
			if vim.fn.isdirectory(dir) == 0 then
				vim.fn.mkdir(dir, "p")
			end
		end

		-- Lê o template
		local function read_template()
			local template_path = string.format("%s/%s", M.config.obsidian_dir, M.config.template_file)

			if vim.fn.filereadable(template_path) == 1 then
				local lines = vim.fn.readfile(template_path)
				return lines
			else
				-- Template padrão
				return {
					"---",
					"tags:",
					"  - diario",
					'date: "' .. os.date("%d/%m/%Y") .. '"',
					"---",
					"",
				}
			end
		end

		-- Cria a nota diária
		local function create_daily_note(filepath)
			ensure_dir_exists(filepath)

			local template_lines = read_template()
			local formatted_date = os.date("%d/%m/%Y")

			-- Substitui placeholder da data
			for i, line in ipairs(template_lines) do
				template_lines[i] = line:gsub("{{date:DD/MM/YYYY}}", formatted_date)
			end

			vim.fn.writefile(template_lines, filepath)
		end

		-- Verifica se estamos no diretório Obsidian
		local function is_in_obsidian_dir()
			local cwd = vim.fn.getcwd()
			local obsidian_dir = vim.fn.expand(M.config.obsidian_dir)

			cwd = vim.fn.resolve(cwd)
			obsidian_dir = vim.fn.resolve(obsidian_dir)

			return cwd == obsidian_dir
		end

		-- ================================
		-- Função Principal
		-- ================================

		function M.open_daily_note()
			local daily_note = get_daily_note_path()

			-- Cria a nota se não existir
			if vim.fn.filereadable(daily_note) == 0 then
				create_daily_note(daily_note)
				vim.notify("📝 Nota diária criada: " .. vim.fn.fnamemodify(daily_note, ":."), vim.log.levels.INFO)
			end

			-- Abre a nota
			vim.cmd("edit " .. vim.fn.fnameescape(daily_note))
		end

		-- ================================
		-- Auto-comando
		-- ================================

		local augroup = vim.api.nvim_create_augroup("ObsidianDaily", { clear = true })

		vim.api.nvim_create_autocmd("VimEnter", {
			group = augroup,
			callback = function()
				-- Verifica se estamos no diretório Obsidian e sem argumentos
				if is_in_obsidian_dir() and vim.fn.argc() == 0 then
					vim.defer_fn(function()
						M.open_daily_note()
					end, 100)
				end
			end,
			desc = "Abre nota diária ao entrar no diretório Obsidian",
		})

		-- ================================
		-- Comandos
		-- ================================

		vim.api.nvim_create_user_command("ObsidianDaily", function()
			M.open_daily_note()
		end, { desc = "Abre ou cria a nota diária" })

		vim.api.nvim_create_user_command("Today", function()
			M.open_daily_note()
		end, { desc = "Abre a nota de hoje" })

		-- ================================
		-- Keymaps (opcional)
		-- ================================

		-- Atalho para abrir nota de hoje
		vim.keymap.set("n", "<leader>ot", ":ObsidianDaily<CR>", {
			desc = "Open today's note",
			silent = true,
		})

		-- Navegar para próximo dia
		vim.keymap.set("n", "<leader>on", function()
			local current_file = vim.fn.expand("%:t:r")
			local day, month, year = current_file:match("(%d+)-(%d+)-(%d+)")

			if day then
				local next_date = os.time({ year = tonumber(year), month = tonumber(month), day = tonumber(day) })
					+ 86400
				local next_file = os.date("%d-%m-%Y", next_date)
				local next_path = string.format(
					"%s/when/%s/%s/%s.md",
					M.config.obsidian_dir,
					os.date("%Y", next_date),
					os.date("%m", next_date),
					next_file
				)

				if vim.fn.filereadable(next_path) == 1 then
					vim.cmd("edit " .. vim.fn.fnameescape(next_path))
				else
					vim.notify("⚠️  Nota do próximo dia não existe", vim.log.levels.WARN)
				end
			end
		end, { desc = "Open next day's note" })

		-- Navegar para dia anterior
		vim.keymap.set("n", "<leader>op", function()
			local current_file = vim.fn.expand("%:t:r")
			local day, month, year = current_file:match("(%d+)-(%d+)-(%d+)")

			if day then
				local prev_date = os.time({ year = tonumber(year), month = tonumber(month), day = tonumber(day) })
					- 86400
				local prev_file = os.date("%d-%m-%Y", prev_date)
				local prev_path = string.format(
					"%s/when/%s/%s/%s.md",
					M.config.obsidian_dir,
					os.date("%Y", prev_date),
					os.date("%m", prev_date),
					prev_file
				)

				if vim.fn.filereadable(prev_path) == 1 then
					vim.cmd("edit " .. vim.fn.fnameescape(prev_path))
				else
					vim.notify("⚠️  Nota do dia anterior não existe", vim.log.levels.WARN)
				end
			end
		end, { desc = "Open previous day's note" })

		-- Buscar notas com Telescope (se disponível)
		vim.keymap.set("n", "<leader>of", function()
			local telescope_ok, builtin = pcall(require, "telescope.builtin")
			if telescope_ok then
				builtin.find_files({
					cwd = M.config.obsidian_dir .. "/" .. M.config.daily_notes_dir,
					prompt_title = "Daily Notes",
				})
			else
				vim.notify("⚠️  Telescope não está instalado", vim.log.levels.WARN)
			end
		end, { desc = "Find daily notes" })

		-- Buscar conteúdo nas notas
		vim.keymap.set("n", "<leader>og", function()
			local telescope_ok, builtin = pcall(require, "telescope.builtin")
			if telescope_ok then
				builtin.live_grep({
					cwd = M.config.obsidian_dir,
					prompt_title = "Search in notes",
				})
			else
				vim.notify("⚠️  Telescope não está instalado", vim.log.levels.WARN)
			end
		end, { desc = "Search in notes" })

		return M
	end,
}
