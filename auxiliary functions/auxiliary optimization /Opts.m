classdef Opts < handle
    
    properties
        key
        num_its
        lambda
        initialization
    end
    
    
    methods
        
        function obj = Opts()
            obj.key = 'mu';
            obj.num_its = 50;
            obj.lambda = 0;
        end
        
        
        function set.key(obj, key)
            obj.key = key;
        end
        
        function set.num_its(obj, num_its)
            obj.num_its = num_its;
        end
        
        function set.lambda(obj, lambda)
            obj.lambda = lambda;
        end
        
        function set.initialization(obj, initialization)
            obj.initialization = initialization;
        end

    end
    
end