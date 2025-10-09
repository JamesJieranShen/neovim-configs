return {
  {
    "ThePrimeagen/refactoring.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.print_var_statements.cpp = { 'std::cout << "%s" << ": " << %s << std::endl;' }
      opts.printf_statements.cpp = { 'std::cout << "%s" << std::endl;' }
    end,
  },
}
