require "imba/template/version"
require "imba/source"
require "tilt"
require "execjs"

module Imba
  class Template < ::Tilt::Template
    PATH = ["imbac.dev.js", "imbac.js"]
      .map { |x| Imba::Source.path_for(x) }
      .detect { |x| File.exist?(x) }

    def self.compiler_path
      PATH or raise "Cannot find Imba source code"
    end

    def self.compiler_source
      File.read(compiler_path)
    end

    def self.context
      @context ||= ExecJS.compile <<-EOF
        var self = this;#{compiler_source}
        Imbac.compileToString = function(code,o) {
          return Imbac.compile(code,o).toString();
        }
      EOF
    end

    def context
      self.class.context
    end

    def prepare
      options[:sourcePath] ||= eval_file
      @code = context.call("Imbac.compileToString", data, options)
    end

    def evaluate(scope, locals, &block)
      @code
    end
  end
end

Tilt.register Imba::Template, 'imba'
