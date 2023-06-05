
def main() -> None:
    with open("input.txt", 'r') as f:
        lines = f.readlines()
    cal_arr = [line.strip() for line in lines]

    cal_sums = []
    cal_sum = 0
    for cal in cal_arr:
        if cal == '':
            cal_sums.append(cal_sum)
            cal_sum = 0
            continue
        else:
            cal_sum += int(cal)

    print(f"[Part 1]  Maximum calories : {max(cal_sums)} cal.")
    cal_sort = sorted(cal_sums, reverse=True)
    print(f"[Part 2]  Top 3 calories : {sum(cal_sort[:3])} cal ")


if __name__ == "__main__":
    main()
    
