return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "lewis6991/async.nvim",
    },
    event = "VeryLazy",
    opts = function(_, opts)
      opts.debug = {
        print_var = {
          code_generation = {
            print_var = {
              cpp = function(o)
                return ('std::cout << "%s %s %s:" << " " << %s << std::endl;'):format(
                  o.debug_path,
                  o.identifier_str,
                  o.count,
                  o.identifier
                )
              end,
            },
          },
        },
        print_loc = {
          code_generation = {
            print_loc = {
              cpp = function(o)
                return ('std::cout << "%s %s" << std::endl;'):format(
                  o.debug_path,
                  o.count
                )
              end,
            },
          },
        },
      }
    end,
  },
}
