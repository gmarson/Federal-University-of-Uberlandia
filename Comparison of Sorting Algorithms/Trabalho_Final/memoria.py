import psutil
import resource


def memory_usage_resource():
    # return the memory usage in MB
    rusage_denom = 1024.
    mem = resource.getrusage(resource.RUSAGE_SELF).ru_maxrss / rusage_denom
    return mem

