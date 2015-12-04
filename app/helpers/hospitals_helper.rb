module HospitalsHelper
    def generate_ref
        r = Random.new
        ref = r.rand 10000..99999
        while  Hospital.exists?(:ref => ref) do
            ref = r.rand 10000..99999
        end
        return ref
    end
end
