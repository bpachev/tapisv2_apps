import argparse as ap
import json

if __name__ == "__main__":
    parser = ap.ArgumentParser()
    parser.add_argument("iter", type=int)
    parser.add_argument("np", type=int)
    parser.add_argument("dirnames", nargs="+")
    args = parser.parse_args()
    if args.iter == 1:
        job_list = [{"cores":1, "main": f"./singularity-figuregen.sh {dirname}"} for dirname in args.dirnames]
        with open("jobs_list.json", "w") as fp: json.dump(job_list, fp)
